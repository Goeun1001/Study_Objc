//
//  main.m
//  Playground
//
//  Created by GoEun Jeong on 2021/05/14.
//

#import <Foundation/Foundation.h>
#import "MyFirstClass.h"
#import "ChildClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        [MyFirstClass itIsClassMethod];
//        MyFirstClass *instance = [[MyFirstClass alloc] init];
//
//        [instance setMyName: @"yagom"];
//
//        NSString *name = [instance myName];
//        NSLog(@"My name is %@", name);
//
//        [instance setMySecret:@"It's Top Secret!"];
//        NSLog(@"My secret is %@", [instance getMySecret]);
//
//        instance.myFirstInt = 88;
//        NSLog(@"My First Int is %d", [instance myFirstInt]);
//
//        instance.myName = @"my name";
//        [instance setMyFirstInt:77];
//
//        NSLog(@"My name is %@", [instance myName]);
//        NSLog(@"myFirstInt is %d", [instance myFirstInt]);
        
//        NSInteger firstInt = 100;
//        NSInteger secondInt = 200;
//        NSInteger resultInt = 0;
//
//        resultInt = [instance addTwoIntegerWithFirstInt:firstInt secondInt:secondInt];
//
//        NSLog(@"resultInt : %ld (%ld + %ld)", resultInt, firstInt, secondInt);
//
//        NSString *yagomString = @"Hello, I'm Yagom!";
//        NSString *resultString = NULL;
//
//        resultString = [instance changeToUpperOrLowerCaseWithString:yagomString isToUppercase:YES];
//
//        NSLog(@"resultString: %@", resultString);
//
//        NSLog(@"resultString: %@", [instance changeToUpperOrLowerCaseWithString:yagomString isToUppercase:NO]);
        
//        [ChildClass itIsClassMethod];
//
//        ChildClass *instance = [[ChildClass alloc] init];
//
//        [instance getMySecret];
//
//        [instance setMyName:@"My name is Yagom"];
//        NSLog(@"%@", [instance myName]);
//
//        [[instance superclass] itIsClassMethod];
//
//        [instance getMySecret];
        
        NSString *name = @"yagom";
        NSNumber *number = [NSNumber numberWithInt:1004];
        NSArray *array = [NSArray arrayWithObjects:name, number, nil];
        NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:name, @"name",
                                    number, @"number",
                                    array, @"array",
                                    nil];
        NSLog(@"array: %@", array);
        NSLog(@"dictionary: %@", dictionary);
        
    }
    return 0;
}
