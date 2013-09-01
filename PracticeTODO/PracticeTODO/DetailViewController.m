//
//  DetailViewController.m
//  PracticeTODO
//
//  Created by 古田 貴久 on 2013/08/31.
//  Copyright (c) 2013年 古田 貴久. All rights reserved.
//

#import "DetailViewController.h"
#import "TDEditController.h"
#import <QuartzCore/QuartzCore.h>

@interface DetailViewController ()

@property(weak,nonatomic) IBOutlet UILabel *titleLabel;
@property (weak,nonatomic) IBOutlet UITextView *textView;

@end

@implementation DetailViewController

#pragma mark -Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier]isEqualToString:@"GotoEditView"]){
        TDEditController* viewController = [segue destinationViewController];
        viewController.todoObject = self.todoObject;
        
    }
    
}

#pragma mark - View cycle

- (void)viewDidLoad{
    self.textView.layer.borderColor = [UIColor blackColor].CGColor;
    self.textView.layer.borderWidth = 2.0f;
}
- (void)viewWillAppear:(BOOL)animated{
    self.titleLabel.text = self.todoObject.title;
    self.textView.text = self.todoObject.text;
}

@end