//
//  TDAppDelegate.h
//  ToDoSample
//
//  Created by 石井 晃 on 13/08/29.
//  Copyright (c) 2013年 exilias.net. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
