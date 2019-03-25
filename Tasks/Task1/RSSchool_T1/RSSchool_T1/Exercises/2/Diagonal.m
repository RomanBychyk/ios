#import "Diagonal.h"

@implementation Diagonal

// Complete the diagonalDifference function below.
- (NSNumber *) diagonalDifference:(NSArray *)array {
    
    
    NSInteger n = [array count];
    
    int diff = 0;
    for (int i = 0; i < n; i++) {
        int valMain = [self getElementFromArray: array withIndexI: i andJ: i];
        
        int j = (int) n - 1 - i;
        int valOpposite = [self getElementFromArray: array withIndexI: i andJ: j];
        
        diff += valMain - valOpposite;
    }
    
    return @(abs(diff));
}

- (int) getElementFromArray: (NSArray *)array withIndexI: (int) i andJ: (int) j {
    NSString* objAtIndexI = [array objectAtIndex:i];
    return [[[objAtIndexI componentsSeparatedByString:@" "] objectAtIndex:j] intValue];
}

@end
