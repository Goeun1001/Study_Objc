//
//  ComposeViewController.h
//  KxMemoObjC
//
//  Created by GoEun Jeong on 2021/05/17.
//

#import <UIKit/UIKit.h>
#import "Memo+CoreDataProperties.h"

NS_ASSUME_NONNULL_BEGIN

@interface ComposeViewController : UIViewController

@property (strong, nonatomic) Memo* editTarget;

@end

NS_ASSUME_NONNULL_END
