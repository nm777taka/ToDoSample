//
//  TDInsertViewController.m
//  ToDoSample
//
//  Created by 石井 晃 on 13/08/29.
//  Copyright (c) 2013年 exilias.net. All rights reserved.
//

#import "TDInsertViewController.h"

#import <QuartzCore/QuartzCore.h>

#import "TDTodo.h"


@interface TDInsertViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextView *textView;

- (IBAction)pushedDoneButton:(id)sender;

@end

@implementation TDInsertViewController


#pragma mark - Action

- (IBAction)pushedDoneButton:(id)sender
{
	if ([self.titleField.text length] == 0) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"エラー"
														message:@"タイトルを入力してください。"
														delegate:self
														cancelButtonTitle:@"OK"
														otherButtonTitles:nil, nil];
		[alert show];
		return;
	}
	
	// 新しいエンティティを追加する
	TDTodo *newTodo = [TDTodo MR_createEntity];
	newTodo.title = self.titleField.text;
	newTodo.text = self.textView.text;
	newTodo.timeStamp = [NSDate date];
	
	NSManagedObjectContext *context = [NSManagedObjectContext MR_defaultContext];
	[context MR_saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
		if (success) {
			NSLog(@"-------------> saved\n%@", newTodo);
		} else {
			NSLog(@"save error: %@", error);
		}
		
		[self.navigationController popViewControllerAnimated:YES];
	}];
}



#pragma mark - View cycle


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
		
	self.titleField.placeholder = @"タイトルを入力してください";
	
	self.textView.layer.borderColor = [UIColor blackColor].CGColor;
	self.textView.layer.borderWidth = 2.0f;
}


#pragma mark - Memory

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
