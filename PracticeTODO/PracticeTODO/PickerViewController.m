//
//  PickerViewController.m
//  PracticeTODO
//
//  Created by 古田 貴久 on 2013/09/01.
//  Copyright (c) 2013年 古田 貴久. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()


- (IBAction)DeleteTrigger:(id)sender;

@end

@implementation PickerViewController

#pragma  mark PicerMethod





- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //DatePicker生成
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    CGRect Pickerframe = CGRectMake(0, self.view.bounds.size.height-216, self.view.bounds.size.width, 216);
    datePicker.frame = Pickerframe;
    
    datePicker.minuteInterval = 5;
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    
    [datePicker addTarget:self action:@selector(valueChenged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:datePicker];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)DeleteTrigger:(id)sender {
    [self.parent deletePickerView:self];
}
@end
