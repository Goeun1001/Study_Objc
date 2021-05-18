//
//  Memo+CoreDataProperties.m
//  KxMemoObjC
//
//  Created by GoEun Jeong on 2021/05/17.
//
//

#import "Memo+CoreDataProperties.h"

@implementation Memo (CoreDataProperties)

+ (NSFetchRequest<Memo *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Memo"];
}

@dynamic content;
@dynamic insertDate;

@end
