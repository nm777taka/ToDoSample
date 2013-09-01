//
//  PickerViewController.h
//  PracticeTODO
//
//  Created by 古田 貴久 on 2013/09/01.
//  Copyright (c) 2013年 古田 貴久. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PickerViewControllerDelegate;

@interface PickerViewController : UIViewController

@property(strong,nonatomic)id<PickerViewControllerDelegate> parent;

@end

@protocol PickerViewControllerDelegate <NSObject>

- (void) showPickedDate:(NSString*)str date:(NSDate*)date;
- (void) deletePickerView:(PickerViewController*)controller;
@end