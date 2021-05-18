//
//  DataManager.h
//  KxMemoObjC
//
//  Created by GoEun Jeong on 2021/05/17.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Memo+CoreDataProperties.h"

NS_ASSUME_NONNULL_BEGIN

@interface DataManager : NSObject

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

+ (instancetype)sharedInstance;

@property (readonly, strong) NSManagedObjectContext* mainContext;
@property (strong, nonatomic) NSMutableArray* memoList;

- (void) fetchMemo;
- (void) addNewMemo: (NSString*)memo;
- (void) deleteMemo: (Memo*)memo;

@end

NS_ASSUME_NONNULL_END
