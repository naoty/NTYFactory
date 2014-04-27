# NTYFactory

[![Version](http://cocoapod-badges.herokuapp.com/v/NTYFactory/badge.png)](http://cocoadocs.org/docsets/NTYFactory)
[![Platform](http://cocoapod-badges.herokuapp.com/p/NTYFactory/badge.png)](http://cocoadocs.org/docsets/NTYFactory)

## Usage

### Define factory

```objective-c
NTYFactory *userFactory = [NTYFactory factoryWithManagedObjectContext:context entityName:@"User" defaults:@{
    @"name": @"Alice",
    @"age": @18
}];
```

### Create an object

```objective-c
User *defaultUser = [userFactory create];
User *bob = [userFactory createWithProperties:@{@"name": @"Bob", @"age": @19}];
```

### Create objects

```objective-c
NSArray *usersProperties = @[
    @{@"name": @"Charlie"},
    @{@"name": @"Dave", @"age": @20},
    @{@"name": @"Ellen"}
];
NSArray *users = [userFactory createListWithProperties:usersProperties];
```
