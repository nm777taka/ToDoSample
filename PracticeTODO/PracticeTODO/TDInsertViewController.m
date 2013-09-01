//
//  TDInsertViewController.m
//  PracticeTODO
//
//  Created by 古田 貴久 on 2013/09/01.
//  Copyright (c) 2013年 古田 貴久. All rights reserved.
//

#import "TDInsertViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"

@interface TDInsertViewController (){
    NSDate* pickedDate;
}

@property (weak, nonatomic) IBOutlet UITextField *TitleField;
@property (weak, nonatomic) IBOutlet UITextView *textField;

@property(nonatomic,retain) UIActionSheet *actionSheet;
@property (weak, nonatomic) IBOutlet UIButton *CallDPButton;
@property(nonatomic,retain) UIDatePicker *datePicker;

- (IBAction)pushDoneButton:(id)sender;
- (IBAction)CallDP:(id)sender;

@end

@implementation TDInsertViewController


#pragma mark Action

- (IBAction)pushDoneButton:(id)sender {
    
    if([self.textField.text length]==0){
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"エラー"
                                                       message:@"タイトルを入力してください"
                                                      delegate:self cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil, nil];
        [alert show];
        
        return;
    }
    
    //新しいエンティティを追加する
    Todo *newTodo = [Todo MR_createEntity];
    newTodo.title = self.TitleField.text;
    newTodo.text = self.textField.text;
    newTodo.timeStamp = pickedDate;
    
    NSManagedObjectContext *context = [NSManagedObjectContext MR_defaultContext];
    [context MR_saveOnlySelfWithCompletion:^(BOOL success, NSError *error) {
        if(success){
            NSLog(@"---------> saved\n%@",newTodo);
        }else{
            NSLog(@"save error: %@",error);
        }
        
        //ひとつ前の画面に戻る
        [self.navigationController popViewControllerAnimated:YES];
    }];

    

}
#pragma mark showDP

- (IBAction)CallDP:(id)sender {
    self.actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
    [self.actionSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
    
    CGRect pickerFrame = CGRectMake(0, 40, 0, 0);
    self.datePicker = [[UIDatePicker alloc]initWithFrame:pickerFrame];
    self.datePicker.tag = 10;
    [self.datePicker addTarget:self action:@selector(changeDate:) forControlEvents:UIControlEventValueChanged];
    [self.actionSheet addSubview:self.datePicker];
    
    UISegmentedControl* closeButton = [[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObject:@"OK"]];
    
    closeButton.momentary = YES;
    closeButton.frame = CGRectMake(260, 7.0f, 50.0f, 30.0f);
    closeButton.segmentedControlStyle = UISegmentedControlStyleBar;
    closeButton.tintColor = [UIColor blackColor];
    [closeButton addTarget:self action:@selector(dismissActionsheet:) forControlEvents:UIControlEventValueChanged];
    [self.actionSheet addSubview:closeButton];
    
    
    [self.actionSheet showInView:self.view];
    [self.actionSheet setBounds:CGRectMake(0, 0, 320, 485)];

}

#pragma mark ActionSheetMethod

- (void)changeDate:(UIDatePicker*)sender{
    NSDateFormatter* df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"MM/dd HH:mm"];
    NSString* str = [df stringFromDate:sender.date];
    [self.CallDPButton setTitle:str forState:UIControlStateNormal];
    pickedDate = sender.date;
}
- (void)dismissActionsheet:(UISegmentedControl *)sender{
    UIActionSheet *actionsheet = (UIActionSheet*)[sender superview];
    [actionsheet dismissWithClickedButtonIndex:0 animated:YES];
    

}

#pragma mark TextfiledMethod

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.TitleField resignFirstResponder];
    
    return YES;
}

#pragma mark View cycle
- (void)viewDidLoad{
    
    self.TitleField.placeholder = @"タイトルを入力してください";
    self.TitleField.delegate = self;
    self.textField.layer.borderColor = [UIColor blackColor].CGColor;
    self.textField.layer.borderWidth = 2.0f;
    
    
   
}
@end
