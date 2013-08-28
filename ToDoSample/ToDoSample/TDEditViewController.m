//
//  TDEditViewController.m
//  ToDoSample
//
//  Created by 石井 晃 on 13/08/29.
//  Copyright (c) 2013年 exilias.net. All rights reserved.
//

#import "TDEditViewController.h"

@interface TDEditViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation TDEditViewController

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
	
	self.titleField.text = self.todoObject.title;
	self.textView.text = self.todoObject.text;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
