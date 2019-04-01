#import "RomanTranslator.h"

@implementation RomanTranslator

- (NSUInteger) getValueFromChar: (unichar) ch {
    switch (ch) {
        case 'I': return 1;
        case 'V': return 5;
        case 'X': return 10;
        case 'L': return 50;
        case 'C': return 100;
        case 'D': return 500;
        case 'M': return 1000;
            
        default:
            return 0;
    }
}

// your code here
- (NSString *)arabicFromRoman:(NSString *)romanString {
    NSInteger prev = -1;
    NSUInteger number = 0;
    
    for (int i = 0; i < [romanString length]; i++) {
        NSUInteger value = [self getValueFromChar: [romanString characterAtIndex:i]];
    
        number += value;
        
        if (prev == -1) {
            prev = value;
        } else {
            if (prev < value) {
                number -= 2 * prev;
                prev = -1;
            } else {
                prev = value;
            }
        }
    }
    
    return [NSString stringWithFormat:@"%lu", (unsigned long)number];
}

- (NSString *)arabicFromRoman2:(NSString *)romanString {

    NSUInteger number = [self getValueFromChar: [romanString characterAtIndex:0]];
    
    for (int i = 1; i < [romanString length] - 1; i++) {
        NSUInteger value = [self getValueFromChar: [romanString characterAtIndex: i]];
        NSUInteger nextValue = [self getValueFromChar: [romanString characterAtIndex: i + 1]];
        
        if (nextValue > value) {
            number += nextValue - value;
        } else {
            number += value;
        }
    }
    
    return [NSString stringWithFormat:@"%lu", (unsigned long)number];
}


- (NSString *)romanFromArabic:(NSString *) arabicString {
    NSMutableString *resultString = [NSMutableString new];
    for (int i = (int)[arabicString length] - 1; i >= 0; i--) {
        
        NSString *numberPart = [self getCharFromValue: [arabicString characterAtIndex:i] - '0' withNumberOrder: i];
        
        NSLog(@"NumberPart %@", numberPart);
        
        [resultString appendString:numberPart];
    }
    
    return resultString;
}



- (NSString *) getCharFromValue: (int) digit withNumberOrder: (int) order {
    
    unichar romanDigits[] = {'M', 'D', 'C', 'L', 'X', 'V', 'I'};
    

    int basePosition = 6 - order * 2 - 1;
    
    char left = romanDigits[basePosition - 1];
    char baseString = romanDigits[basePosition];
    char right = romanDigits[basePosition + 1];
     
    switch (digit) {
        case 1: return [NSString stringWithFormat:@"%c", right];
        case 2: return [NSString stringWithFormat:@"%c%c", right, right];
        case 3: return [NSString stringWithFormat:@"%c%c%c", right, right, right];
        case 4: return [NSString stringWithFormat:@"%c%c", right, baseString];
        case 5: return [NSString stringWithFormat:@"%c", baseString];
        case 6: return [NSString stringWithFormat:@"%c%c", baseString, right];
        case 7: return [NSString stringWithFormat:@"%c%c%c", baseString, right, right];
        case 8: return [NSString stringWithFormat:@"%c%c%c%c", baseString, right, right, right];
        case 9: return [NSString stringWithFormat:@"%c%c", right, left];
            
        default:
            break;
    }
    
    return @"";
}


@end
