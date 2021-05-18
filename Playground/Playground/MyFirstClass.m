//
//  NSObject+MyFirstClass.m
//  Playground
//
//  Created by GoEun Jeong on 2021/05/14.
//

#import "MyFirstClass.h"

@implementation MyFirstClass

@synthesize myFirstInt, myName;

- (void) myFirstMethod {
    NSLog(@"It is instance method");
}

- (void) setMySecret:(NSString *)secret {
    mySecret = [NSString stringWithString:secret];
}

- (NSString *) getMySecret {
    return mySecret;
}

+ (void) itIsClassMethod {
    NSLog(@"It is a class method");
}

- (NSInteger) addTwoIntegerWithFirstInt:(NSInteger)firstInteger secondInt:(NSInteger)secondInteger {
    return firstInteger + secondInteger;
}

- (NSString *) changeToUpperOrLowerCaseWithString:(NSString *)targetString isToUppercase:(BOOL)isToUppercase {
    if (isToUppercase == YES) {
        return [targetString uppercaseString];
    } else {
        return [targetString lowercaseString];
    }
}

- (void) printFoo {
    NSLog(@"Foo");
}

@end
