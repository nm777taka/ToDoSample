//
//  TDEditController.m
//  PracticeTODO
//
//  Created by 古田 貴久 on 2013/09/01.
//  Copyright (c) 2013年 古田 貴久. All rights reserved.
//

#import "TDEditController.h"

#import <QuartzCore/QuartzCore.h>

@interface TDEditController ()

@property(weak,nonatomic) IBOutlet UITextField* titleField;
@property (weak,nonatomic) IBOutlet UITextView* textView;

- (IBAction)pushedDoneButton:(id)sender;


@end

@implementation TDEditController

#pragma mark -Action

- (IBAction)pushedDoneButton:(id)sender{
    if([self.titleField.text length]==0){
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"エラー"
                                                       message:@"タイトルを入力してください"
                                                       delegate:self
                                                       cancelButtonTitle:@"OK"
                                                       otherButtonTitles:nil, nil];
        
        [alert show];
        return;
        
    }
    
    NSManagedObjectContext *context = [NSManagedObjectContext MR_defaultContext];
    self.todoObject.title = self.titleField.text;
    self.todoObject.text  =  self.textView.text;
    [context MR_saveOnlySelfWithCompletion:^(BOOL success, NSError *error) {
        if(success){
            NSLog(@"-----------> saved\n%@",self.todoObject);
        }else{
            NSLog(@"save error:%@",error);
        }
        [self.navigationController popViewControllerAnimated:YES];
    }];
}

#pragma mark -View cycle

- (void)viewDidLoad{
    self.textView.layer.borderColor = [UIColor blackColor].CGColor;
    self.textView.layer.borderWidth = 2.0f;
    
    self.titleField.text = self.todoObject.title;
    self.textView.text = self. todoObject.text;
}



@end
