//
//  TDMasterViewController.m
//  ToDoSample
//
//  Created by 石井 晃 on 13/08/29.
//  Copyright (c) 2013年 exilias.net. All rights reserved.
//

#import "TDMasterViewController.h"

#import "TDTodo.h"

#import "TDDetailViewController.h"

@interface TDMasterViewController ()

@property NSArray *todoObjects;
@property NSInteger selectedRow;

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
@end

@implementation TDMasterViewController


#pragma mark - Action

- (NSArray *)fetchTodoObjects
{
	return [TDTodo MR_findAllSortedBy:@"timeStamp" ascending:NO];
}


- (void)insertNewObject:(id)sender
{
	[self performSegueWithIdentifier:@"GotoInsertView" sender:self];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
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
		TDTodo *object = [self.todoObjects objectAtIndex:indexPath.row];
		[object MR_deleteEntity];
		self.todoObjects = [self fetchTodoObjects];
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // The table view should not be re-orderable.
    return NO;
}


- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
	TDTodo *object = [self.todoObjects objectAtIndex:indexPath.row];
	cell.textLabel.text = object.title;
}


#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"GotoDetailView"]) {
		TDDetailViewController *viewController = [segue destinationViewController];
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
