# NTYFactory

[![Version](http://cocoapod-badges.herokuapp.com/v/NTYFactory/badge.png)](http://cocoadocs.org/docsets/NTYFactory)
[![Platform](http://cocoapod-badges.herokuapp.com/p/NTYFactory/badge.png)](http://cocoadocs.org/docsets/NTYFactory)

## Usage

### Basic

```objective-c
// Define factory
NTYFactory *userFactory = [NTYFactory factoryWithManagedObjectContext:context entityName:@"User" defaultProperties:@{
    @"name": @"Alice",
    @"age": @18
}];

// Create an object
NSManagedObject *defaultUser = [userFactory create];
NSManagedObject *bob = [userFactory createWithProperties:@{@"name": @"Bob", @"age": @19}];

// Create objects
NSArray *users = [userFactory createListWithPropertiesList:@[
    @{@"name": @"Charlie"},
    @{@"name": @"Dave", @"age": @19},
    @{@"name": @"Ellen", @"age": @20}
]];
```

### Sequence

```objective-c
NTYFactory *userFactory = [NTYFactory factoryWithManagedObjectContext:context entityName:@"User" defaultProperties:@{
    @"name": [NTYSequentialString stringWithFormat:@"User %@" from:@1],
    @"age": [NTYSequentialNumber numberFromNumber:@18 step:@3]
}];

NSArray *users = [userFactory createListByNumber:@10];
```