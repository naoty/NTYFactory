//
//  NTYSequentialString.m
//  Pods
//
//  Created by naoty on 2014/04/28.
//
//

#import "NTYSequentialString.h"

@interface NTYSequentialString ()
@property (nonatomic, copy) NSString *format;
@property (nonatomic) NSNumber *from;
@property (nonatomic) NSNumber *step;
@property (nonatomic) NSNumber *sequenceCount;
@end

@implementation NTYSequentialString

+ (instancetype)stringWithFormat:(NSString *)format from:(NSNumber *)from step:(NSNumber *)step
{
    return [[self alloc] initWithFormat:format from:from step:step];
}

+ (instancetype)stringWithFormat:(NSString *)format from:(NSNumber *)from
{
    return [self stringWithFormat:format from:from step:@1];
}

+ (instancetype)stringWithFormat:(NSString *)format step:(NSNumber *)step
{
    return [self stringWithFormat:format from:@0 step:step];
}

+ (instancetype)stringWithFormat:(NSString *)format
{
    return [self stringWithFormat:format from:@0 step:@1];
}

- (NSString *)string
{
    self.sequenceCount = @(self.sequenceCount.intValue + self.step.intValue);
    return [NSString stringWithFormat:self.format, self.sequenceCount];
}

- (NSString *)description
{
    return self.string;
}

#pragma mark - Private methods

- (id)init
{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

- (instancetype)initWithFormat:(NSString *)format from:(NSNumber *)from step:(NSNumber *)step
{
    self = [super init];
    if (self) {
        self.format = format;
        self.from = from;
        self.step = step;
        self.sequenceCount = @(self.from.intValue - self.step.intValue);
    }
    return self;
}

@end
