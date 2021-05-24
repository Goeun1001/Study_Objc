//
//  ViewController.h
//  ImageProcessing
//
//  Created by GoEun Jeong on 2021/05/18.
//

#import <UIKit/UIKit.h>
#import "ImageProcessing.h"

@interface ViewController : UIViewController <UIImagePickerControllerDelegate> {
    ImageProcessing* PImageProcessing;
    UIImage* originImage;
}

@end

