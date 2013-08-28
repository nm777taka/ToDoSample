//
//  TDDetailViewController.h
//  ToDoSample
//
//  Created by 石井 晃 on 13/08/29.
//  Copyright (c) 2013年 exilias.net. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TDDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
