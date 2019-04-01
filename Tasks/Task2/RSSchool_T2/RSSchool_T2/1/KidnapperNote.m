#import "KidnapperNote.h"


@interface KidnapperNote()

- (NSCountedSet *) getWordsArrayFromString: (NSString *)string;

@end

@implementation KidnapperNote

- (BOOL)checkMagazine:(NSString *)magazine note:(NSString *)note {
    NSCountedSet *wordsInMagazine = [self getWordsArrayFromString: magazine];
    NSCountedSet *wordsInNote = [self getWordsArrayFromString: note];
    
    for (NSString *word in wordsInNote) {
        NSUInteger countOfWordInNote = [wordsInNote countForObject:word];
        NSUInteger countOfWordInMagazine = [wordsInMagazine countForObject:word];
        
        if (countOfWordInNote > countOfWordInMagazine) {
            return NO;
        }
    }
    
    return YES;
}

- (NSCountedSet *) getWordsArrayFromString: (NSString *)string {
    NSArray *wordsArray = [string componentsSeparatedByString: @" "];
    NSCountedSet *words = [NSCountedSet new];
    
    for (NSString *word in wordsArray) {
        [words addObject:[word lowercaseString]];
    }
    
    return words;
}

@end
