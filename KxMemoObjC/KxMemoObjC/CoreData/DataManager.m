//
//  DataManager.m
//  KxMemoObjC
//
//  Created by GoEun Jeong on 2021/05/17.
//

#import "DataManager.h"
#import "Memo+CoreDataProperties.h"

@implementation DataManager

+(instancetype)sharedInstance {
    static DataManager* sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DataManager alloc] init];
        sharedInstance.memoList = [[NSMutableArray alloc] init];
    });
    return sharedInstance;
}

- (void) fetchMemo {
    NSFetchRequest* request = [[NSFetchRequest alloc] initWithEntityName:@"Memo"];
    
    NSSortDescriptor* sortByDateDesc = [NSSortDescriptor sortDescriptorWithKey:@"insertDate" ascending:NO];
    request.sortDescriptors = @[sortByDateDesc];
    
    NSError* error = nil;
    NSArray* result = [self.mainContext executeFetchRequest:request error: &error];
    [self.memoList setArray:result];
}

- (void) addNewMemo:(NSString *)memo {
    Memo* newMemo = [[Memo alloc] initWithContext: self.mainContext];
    newMemo.content = memo;
    newMemo.insertDate = [NSDate date];
    
    [self saveContext];
}

- (void) deleteMemo: (Memo*)memo {
    if (memo != nil) {
        [self.mainContext deleteObject:memo];
        [self saveContext];
    }
}

- (NSManagedObjectContext*)mainContext {
    return self.persistentContainer.viewContext;
}

#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"KxMemoObjC"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
