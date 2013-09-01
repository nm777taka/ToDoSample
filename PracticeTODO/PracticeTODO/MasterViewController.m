//
//  MasterViewController.m
//  PracticeTODO
//
//  Created by 古田 貴久 on 2013/08/31.
//  Copyright (c) 2013年 古田 貴久. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

#import "Todo.h"

@interface MasterViewController ()

@property NSArray *todoObjects;
@property NSInteger selectedRow;

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
@end

@implementation MasterViewController

#pragma mark - Action

// データベース内に記録されているToDoのEntityをtimeStampでソートしたNSArrayを返す（日付が新しいものほど前）
- (NSArray *)fetchTodoObjects
{
	return [Todo MR_findAllSortedBy:@"timeStamp" ascending:NO];
}


- (void)insertNewObject:(id)sender
{
	[self performSegueWithIdentifier:@"GotoInsertView" sender:self];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	// セクションは常に1つなので1でハードコーディング
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.todoObjects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
	[self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	self.selectedRow = indexPath.row;
	[self performSegueWithIdentifier:@"GotoDetailView" sender:self];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Entityの削除
		Todo *object = [self.todoObjects objectAtIndex:indexPath.row];
		[object MR_deleteEntity];
		NSManagedObjectContext *context = [NSManagedObjectContext MR_defaultContext];
		[context MR_saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
			if (!success) {
				NSLog(@"save error: %@", error);
			}
			
			self.todoObjects = [self fetchTodoObjects];
			[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
		}];
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // The table view should not be re-orderable.
    return NO;
}


- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
	Todo *object = [self.todoObjects objectAtIndex:indexPath.row];
	cell.textLabel.text = object.title;
}


#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"GotoDetailView"]) {
		DetailViewController *viewController = [segue destinationViewController];
		viewController.todoObject = [self.todoObjects objectAtIndex:self.selectedRow];
    }
}


#pragma mark - View cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.navigationItem.leftBarButtonItem = self.editButtonItem;
	
	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
	self.navigationItem.rightBarButtonItem = addButton;
	
	self.todoObjects = [self fetchTodoObjects];
    
}

- (void)viewWillAppear:(BOOL)animated
{
	self.todoObjects = [self fetchTodoObjects];
	[self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
