//
//  Memo+CoreDataProperties.h
//  KxMemoObjC
//
//  Created by GoEun Jeong on 2021/05/17.
//
//

#import "Memo+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Memo (CoreDataProperties)

+ (NSFetchRequest<Memo *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *content;
@property (nullable, nonatomic, copy) NSDate *insertDate;

@end

NS_ASSUME_NONNULL_END
