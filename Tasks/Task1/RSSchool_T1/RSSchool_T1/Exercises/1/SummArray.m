#import "SummArray.h"

@implementation SummArray

// Complete the summArray function below.
- (NSNumber *)summArray:(NSArray *)array {
    
//    int s = 0;
//    for (int i=0; i < [array count]; i++) {
//        s += [[array objectAtIndex:i] integerValue];
//    }
//
    return [SummArray summOfArray:array];
}

+ (NSNumber *)summOfArray:(NSArray *)array {
    int s = 0;
    for (int i=0; i < [array count]; i++) {
        s += [[array objectAtIndex:i] intValue];
    }
    
    return @(s);
}

@end
