#import "MatrixHacker.h"


@interface Matrix ()

@property (nonatomic, copy) CharacterProcessor savedBlock;

@end

@implementation Matrix

- (void)injectCode:(CharacterProcessor)theBlock {
    _savedBlock = theBlock;
}

- (NSArray<id<Character>> *)runCodeWithData:(NSArray<NSString *> *)names {
    NSMutableArray *chars = [NSMutableArray new];
    for (NSString *name in names) {
        [chars addObject:_savedBlock(name)];
    }
    
    return chars;
}

@end

@implementation MatrixHacker

- (CharacterProcessor) injectionBlock {
    return ^(NSString *name) {
        if ([name isEqualToString:@"Neo"]) {
            return [Char createWithName: name isClone:NO];
        }
        
        return [Char createWithName:@"Agent Smith" isClone:YES];
    };
}

@end



@implementation Char

- (NSString *)name {
    return _name;
}

- (BOOL)isClone {
    return _isClone;
}

+ (instancetype)createWithName:(NSString *)name isClone:(BOOL)clone {
    Char *character = [Char new];
    character.name = name;
    character.isClone = clone;
    return character;
}

- (BOOL) isEqual:(id)object {
    if (object == nil) {
        return NO;
    }
    
    if (![object conformsToProtocol:@protocol(Character)]) {
        return NO;
    }
    
    id<Character> character = (id<Character>) object;
    return [[character name] isEqualToString: _name] && [character isClone] == _isClone;
    
}

@end
