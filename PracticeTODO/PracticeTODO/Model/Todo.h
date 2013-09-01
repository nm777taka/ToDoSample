//
//  Todo.h
//  PracticeTODO
//
//  Created by 古田 貴久 on 2013/08/31.
//  Copyright (c) 2013年 古田 貴久. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Todo : NSManagedObject

@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSDate * timeStamp;
@property (nonatomic, retain) NSString * title;

@end
