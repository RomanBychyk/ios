#import "Diagonal.h"

@implementation Diagonal

// Complete the diagonalDifference function below.
- (NSNumber *) diagonalDifference:(NSArray *)array {
    
    // (1, 1), (2, 2), (3, 3)
    
    // n = 3
    // (0, 2), (1, 1), (2, 0)
    // j = n - 1 - i
    
    NSInteger n = [array count];
    
    int mainDiagonalSum = 0;
    for (int i = 0; i < n; i++) {
        int val = [self getElementFromArray: array withIndexI: i andJ: i];
        mainDiagonalSum += val;
    }
    
    int oppositeDiagonalSum = 0;
    for (int i = 0; i < n; i++) {
        int j = (int) n - 1 - i;
        
        int val = [self getElementFromArray: array withIndexI: i andJ: j];
        oppositeDiagonalSum += val;
    }
    
    int sum = abs(mainDiagonalSum - oppositeDiagonalSum);
    return @(sum);
}

// Complete the diagonalDifference function below.
- (NSNumber *) diagonalDifferenceShorter:(NSArray *)array {
    NSInteger n = [array count];
    
    int diff = 0;
    for (int i = 0; i < n; i++) {
        int valMain = [self getElementFromArray: array withIndexI: i andJ: i];
        
        int j = (int) n - 1 - i;
        int valOpposite = [self getElementFromArray: array withIndexI: i andJ: j];
        
        diff += valOpposite - valMain;
    }
    
    return @(diff);
}

- (int) getElementFromArray: (NSArray *)array withIndexI: (int) i andJ: (int) j {
    NSString* objAtIndexI = [array objectAtIndex:i];
    
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"[] "];
    NSArray *elementsInRowI = [[[objAtIndexI componentsSeparatedByCharactersInSet:characterSet]
                       componentsJoinedByString:@" "]
                      componentsSeparatedByString:@" "];
    
    return [[elementsInRowI objectAtIndex:j] intValue];
}

@end
