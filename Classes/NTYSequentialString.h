//
//  NTYSequentialString.h
//  Pods
//
//  Created by naoty on 2014/04/28.
//
//

#import <Foundation/Foundation.h>

@interface NTYSequentialString : NSObject

@property (nonatomic, readonly) NSString *string;

+ (instancetype)stringWithFormat:(NSString *)format from:(NSNumber *)from step:(NSNumber *)step;
+ (instancetype)stringWithFormat:(NSString *)format from:(NSNumber *)from;
+ (instancetype)stringWithFormat:(NSString *)format step:(NSNumber *)step;
+ (instancetype)stringWithFormat:(NSString *)format;

@end
