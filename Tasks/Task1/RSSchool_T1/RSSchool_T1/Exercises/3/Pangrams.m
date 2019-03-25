#import "Pangrams.h"

@implementation Pangrams

// Complete the pangrams function below.
- (BOOL)pangrams:(NSString *)string {
    
    NSString *lowerCaseStr = string.lowercaseString;
    
    bool visited[26];
    
    for (int i = 0; i < 26; i++) {
        visited[i] = false;
    }
    
    int lenght = (int) [lowerCaseStr length];
    for (int i = 0; i < lenght; i++) {
        int ch = [lowerCaseStr characterAtIndex:i];
        int index = ch - 'a';
        
        if (index >= 0 && index < 26) {
            visited[index] = true;
        }
    }
    
    for (int i = 0; i < 26; i++) {
        if (!visited[i]) {
            return NO;
        }
    }
    
    return YES;
}

@end
