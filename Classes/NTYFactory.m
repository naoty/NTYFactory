//
//  NTYFactory.m
//  NTYFactory
//
//  Created by naoty on 2014/04/27.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "NTYFactory.h"

@interface NTYFactory ()
@property (nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, copy) NSString *entityName;
@property (nonatomic) NSDictionary *defaultProperties;
@end

@implementation NTYFactory

+ (instancetype)factoryWithManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
                                     entityName:(NSString *)entityName
                              defaultProperties:(NSDictionary *)defaultProperties
{
    return [[self alloc] initWithManagedObjectContext:managedObjectContext entityName:entityName defaultProperties:defaultProperties];
}

// Deny permission to initialize instance without required properties.
- (id)init
{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

- (id)create
{
    return [self createWithProperties:@{}];
}

- (id)createWithProperties:(NSDictionary *)properties
{
    // Merge given properties into default properties.
    NSMutableDictionary *mergedProperties = [_defaultProperties mutableCopy];
    for (NSString *key in properties) {
        mergedProperties[key] = properties[key];
    }
    
    NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:_entityName inManagedObjectContext:_managedObjectContext];
    for (NSString *key in mergedProperties) {
        [object setValue:mergedProperties[key] forKeyPath:key];
    }
    [_managedObjectContext save:nil];
    
    return object;
}

- (NSArray *)createListWithPropertiesList:(NSArray *)propertiesList
{
    NSMutableArray *objects = [NSMutableArray new];
    for (NSDictionary *properties in propertiesList) {
        [objects addObject:[self createWithProperties:properties]];
    }
    return [objects copy];
}

#pragma mark - Private methods

- (instancetype)initWithManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
                                  entityName:(NSString *)entityName
                           defaultProperties:(NSDictionary *)defaultProperties
{
    self = [super init];
    if (self) {
        self.managedObjectContext = managedObjectContext;
        self.entityName = entityName;
        self.defaultProperties = defaultProperties;
    }
    return self;
}

@end
