//
//  TDDetailViewController.m
//  ToDoSample
//
//  Created by 石井 晃 on 13/08/29.
//  Copyright (c) 2013年 exilias.net. All rights reserved.
//

#import "TDDetailViewController.h"

#import "TDEditViewController.h"


@interface TDDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation TDDetailViewController

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"GotoEditView"]) {
		TDEditViewController *viewController = [segue destinationViewController];
		viewController.todoObject = self.todoObject;
    }
}

#pragma mark - View cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.titleLabel.text = self.todoObject.title;
	self.textView.text = self.todoObject.text;
}


#pragma mark - Memory

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
