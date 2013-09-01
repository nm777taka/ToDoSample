//
//  TDInsertViewController.h
//  PracticeTODO
//
//  Created by 古田 貴久 on 2013/09/01.
//  Copyright (c) 2013年 古田 貴久. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Todo.h"

@interface TDInsertViewController : UIViewController<UITextFieldDelegate>

@property Todo *todoObject;

@end
