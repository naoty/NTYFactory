//
//  NTYAppDelegate.m
//  NTYFactoryDemo
//
//  Created by naoty on 2014/04/27.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "NTYAppDelegate.h"
#import "NTYFactory.h"
#import "NTYSequentialString.h"
#import "NTYSequentialNumber.h"

@interface NTYAppDelegate ()
@property (nonatomic) NSURL *applicationDocumentDirectoryURL;
@property (nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic) NSManagedObjectModel *managedObjectModel;
@end

@implementation NTYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NTYFactory *userFactory = [NTYFactory factoryWithManagedObjectContext:self.managedObjectContext entityName:@"User" defaultProperties:@{
        @"name": [NTYSequentialString stringWithFormat:@"User %@" from:@1],
        @"age": [NTYSequentialNumber numberFromNumber:@18 step:@3]
    }];
    
    [userFactory createListByNumber:@10];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

#pragma mark - Private methods

- (NSURL *)applicationDocumentDirectoryURL
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

#pragma mark - Core Data

- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext) {
        return _managedObjectContext;
    }
    
    if (self.persistentStoreCoordinator) {
        self.managedObjectContext = [NSManagedObjectContext new];
        self.managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
    }
    return self.managedObjectContext;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [self.applicationDocumentDirectoryURL URLByAppendingPathComponent:@"NTYFactoryDemo.sqlite"];
    
    NSError *error = nil;
    self.persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
    [self.persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
    
    if (error) {
        NSLog(@"Error: %@", error);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel) {
        return _managedObjectModel;
    }
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    self.managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

@end
