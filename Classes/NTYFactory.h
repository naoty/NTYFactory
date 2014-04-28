//
//  NTYFactory.h
//  NTYFactory
//
//  Created by naoty on 2014/04/27.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NSManagedObjectContext;

@interface NTYFactory : NSObject

// Define factory
+ (instancetype)factoryWithManagedObjectContext:(NSManagedObjectContext *)context
                                     entityName:(NSString *)entityName
                              defaultProperties:(NSDictionary *)defaults;

// Create an object
- (id)create;
- (id)createWithProperties:(NSDictionary *)properties;

// Create objects
- (NSArray *)createListWithPropertiesList:(NSArray *)propertiesList;
- (NSArray *)createListByNumber:(NSNumber *)number;
- (NSArray *)createListByNumber:(NSNumber *)number properties:(NSDictionary *)properties;

@end
