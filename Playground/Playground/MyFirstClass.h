//
//  NSObject+MyFirstClass.h
//  Playground
//
//  Created by GoEun Jeong on 2021/05/14.
//

#import <Foundation/Foundation.h>

@interface MyFirstClass: NSObject
{
    int myFirstInt;
    NSString *myName;
    NSString *mySecret;
}

@property (nonatomic, assign) int myFirstInt;
@property (nonatomic, retain) NSString *myName;

- (void) myFirstMethod;
- (void) setMySecret:(NSString *)secret;
- (NSString *) getMySecret;

+ (void) itIsClassMethod;

- (NSInteger) addTwoIntegerWithFirstInt:(NSInteger)firstInteger
                    secondInt:(NSInteger)secondInteger;
- (NSString *) changeToUpperOrLowerCaseWithString: (NSString *)targetString
                                    isToUppercase: (BOOL)isToUppercase;
- (void) printFoo;

@end
