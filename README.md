# NTYFactory

[![Version](http://cocoapod-badges.herokuapp.com/v/NTYFactory/badge.png)](http://cocoadocs.org/docsets/NTYFactory)
[![Platform](http://cocoapod-badges.herokuapp.com/p/NTYFactory/badge.png)](http://cocoadocs.org/docsets/NTYFactory)

## Usage

### Define factory

```objective-c
NTYFactory *userFactory = [NTYFactory factoryWithManagedObjectContext:context entityName:@"User" defaultProperties:@{
    @"name": @"Alice",
    @"age": @18
}];
```

### Create an object

```objective-c
NSManagedObject *defaultUser = [userFactory create];
NSManagedObject *bob = [userFactory createWithProperties:@{@"name": @"Bob", @"age": @19}];
```

### Create objects

```objective-c
NSArray *users = [userFactory createListWithPropertiesList:@[
    @{@"name": @"Charlie"},
    @{@"name": @"Dave", @"age": @19},
    @{@"name": @"Ellen", @"age": @20}
]];
```
