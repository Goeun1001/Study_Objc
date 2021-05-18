//
//  NSObject+ChildClass.m
//  Playground
//
//  Created by GoEun Jeong on 2021/05/14.
//

#import "ChildClass.h"

@implementation ChildClass

- (void) getMySecret {
    NSLog(@"getMySecret method was overrided by child class.");
}

+ (void) itIsClassMethod {
    NSLog(@"itIsClass method was overrided by child class.");
}

@end
