#import <XCTest/XCTest.h>
#import "MatrixHacker.h"

@interface MatrixHackerTests : XCTestCase
@property (nonatomic, strong) MatrixHacker *hacker;
@property (nonatomic, strong) Matrix *matrix;
@property (nonatomic, retain) NSArray *people;
@end



@implementation MatrixHackerTests

- (void)setUp {
    self.hacker = [MatrixHacker new];
    self.matrix = [Matrix new];
    self.people = @[@"Delivery Guy", @"Neo", @"Policeman", @"Agent John", @"Agent Black", @"Bartender"];
}

- (void)test1 {
  __block NSInteger counter = 0;
    
    __block CharacterProcessor injectedProcessor = [self.hacker injectionBlock];
    
    
    [self.matrix injectCode:^id<Character>(NSString *name) {
        id<Character> character = injectedProcessor(name);
        if (character != nil) {
            counter += 1;
        }
        
        return character;
    }];
  [self.matrix runCodeWithData:self.people];
  XCTAssertTrue(self.people.count == counter);
}

- (void)test2 {
    __block CharacterProcessor injectionBlock = [self.hacker injectionBlock];
    
    [self.matrix injectCode: injectionBlock];
    NSArray<id<Character>> *Results = [self.matrix runCodeWithData:self.people];
    
    NSArray<Char *> *TestResults = @[
                                    [Char createWithName:@"Agent Smith" isClone:YES],
                                    [Char createWithName:@"Neo" isClone:NO],
                                    [Char createWithName:@"Agent Smith" isClone:YES],
                                    [Char createWithName:@"Agent Smith" isClone:YES],
                                    [Char createWithName:@"Agent Smith" isClone:YES],
                                    [Char createWithName:@"Agent Smith" isClone:YES],
                                    ];
    for (int i = 0; i < [TestResults count]; i++) {
        XCTAssertTrue([Results[i] isEqual: TestResults[i]] );
    }
}


@end
