//
//  NTYAppDelegate.h
//  NTYFactoryDemo
//
//  Created by naoty on 2014/04/27.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NSManagedObjectContext;

@interface NTYAppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic) UIWindow *window;
@property (nonatomic, readonly) NSManagedObjectContext *managedObjectContext;

@end
