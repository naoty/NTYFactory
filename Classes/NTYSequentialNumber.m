//
//  NTYSequentialNumber.m
//  Pods
//
//  Created by naoty on 2014/04/28.
//
//

#import "NTYSequentialNumber.h"

@interface NTYSequentialNumber ()
@property (nonatomic) NSNumber *from;
@property (nonatomic) NSNumber *step;
@property (nonatomic) NSNumber *sequentialCount;
@end

@implementation NTYSequentialNumber

+ (instancetype)numberFromNumber:(NSNumber *)from step:(NSNumber *)step
{
    return [[self alloc] initFromNumber:from step:step];
}

+ (instancetype)numberFromNumber:(NSNumber *)from
{
    return [self numberFromNumber:from step:@1];
}

+ (instancetype)numberByStep:(NSNumber *)step
{
    return [self numberFromNumber:@0 step:step];
}

+ (instancetype)number
{
    return [self numberFromNumber:@0 step:@1];
}

- (NSNumber *)number
{
    self.sequentialCount = @(self.sequentialCount.intValue + self.step.intValue);
    return [self.sequentialCount copy];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", self.number];
}

#pragma mark - Private methods

- (id)init
{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

- (instancetype)initFromNumber:(NSNumber *)from step:(NSNumber *)step
{
    self = [super init];
    if (self) {
        self.from = from;
        self.step = step;
        self.sequentialCount = @(self.from.intValue - self.step.intValue);
    }
    return self;
}

@end
