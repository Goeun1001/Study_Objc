//
//  ImageProcessing.h
//  ImageProcessing
//
//  Created by GoEun Jeong on 2021/05/18.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageProcessing : NSObject {
    unsigned char*rawImage;      // 이미지의 바이트 단위의 데이터
    
    int imageWidth;              // 이미지의 가로 길이
    int imageHeight;             // 이미지의 세로 길이
}

-(void)AllocMemoryImage:(int)width Height:(int)height;
-(id)setImage:(UIImage*)Image;
-(UIImage*)getImage;

-(UIImage*)BitmapToUIImage;
-(UIImage*)BitmapToUIImage:(unsigned char *) bitmap BitmapSize:(CGSize)size;
-(void)DataInit;                // 초기화

-(id)getGrayImage;              // 그레이스케일 처리
-(id)getInverseImage;           // 이미지 반전 처리
-(id)getTrackingImage;          // 이미지 윤곽선 추출 처리

@end

NS_ASSUME_NONNULL_END
