//
//  NTYSequentialNumber.h
//  Pods
//
//  Created by naoty on 2014/04/28.
//
//

#import <Foundation/Foundation.h>

@interface NTYSequentialNumber : NSObject

@property (nonatomic, readonly) NSNumber *number;

+ (instancetype)numberFromNumber:(NSNumber *)from step:(NSNumber *)step;
+ (instancetype)numberFromNumber:(NSNumber *)from;
+ (instancetype)numberByStep:(NSNumber *)step;
+ (instancetype)number;

@end
