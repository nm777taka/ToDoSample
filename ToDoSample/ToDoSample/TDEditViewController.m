//
//  TDEditViewController.m
//  ToDoSample
//
//  Created by 石井 晃 on 13/08/29.
//  Copyright (c) 2013年 exilias.net. All rights reserved.
//

#import "TDEditViewController.h"

#import <QuartzCore/QuartzCore.h>


@interface TDEditViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextView *textView;


- (IBAction)pushedDoneButton:(id)sender;

@end





@implementation TDEditViewController


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
	
	NSManagedObjectContext *context = [NSManagedObjectContext MR_defaultContext];
	self.todoObject.title = self.titleField.text;
	self.todoObject.text = self.textView.text;
	[context MR_saveOnlySelfWithCompletion:^(BOOL success, NSError *error) {
		if (success) {
			NSLog(@"-------------> saved\n%@", self.todoObject);
		} else {
			NSLog(@"save error: %@", error);
		}
		
		[self.navigationController popViewControllerAnimated:YES];
	}];
}



#pragma mark - View cycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	
	self.textView.layer.borderColor = [UIColor blackColor].CGColor;
	self.textView.layer.borderWidth = 2.0f;
	
	self.titleField.text = self.todoObject.title;
	self.textView.text = self.todoObject.text;
}


#pragma mark - Memory

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
