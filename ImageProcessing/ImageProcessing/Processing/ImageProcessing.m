//
//  ImageProcessing.m
//  ImageProcessing
//
//  Created by GoEun Jeong on 2021/05/18.
//

#import "ImageProcessing.h"

typedef enum {
    ALPHA = 0,
    BLUE = 1,
    GREEN = 2,
    RED = 3
} PIXELS;


@implementation ImageProcessing

//이미지 저장공간을 할당합니다.
-(void)AllocMemoryImage:(int)width Height:(int)height
{
    imageWidth = width;
    imageHeight = height;
    
    // 메모리를 할당합니다.
    rawImage = (uint8_t *) malloc(imageWidth * imageHeight * 4 * sizeof(char *));
    memset(rawImage, 0, imageWidth * imageHeight * 4 * sizeof(char *) );
    
}

// 프로세싱할 이미지를 설정합니다.
-(id)setImage:(UIImage*)image
{
    [self DataInit];
       if( image == nil ) {
        return nil;
    }
    
    CGSize size = image.size;
    // 비트뱁 메모리를 할당합니다.
    
    [self AllocMemoryImage:size.width Height:size.height];
    
    // 디바이스의 RGB 컬러 스페이스를 얻습니다.
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // 비트맵 그래픽 컨텍스트를 설정합니다.
    CGContextRef context = CGBitmapContextCreate(rawImage, imageWidth, imageHeight, 8, imageWidth * sizeof(uint32_t), colorSpace,  kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedLast);
    
    // 이미지를 그립니다.
    CGContextDrawImage(context, CGRectMake(0, 0, imageWidth, imageHeight), image.CGImage);
    CGContextRelease(context);    // 그래픽 컨텍스르틑 삭제합니다.
    CGColorSpaceRelease( colorSpace );      // 컬러 스페이스를 해제합니다.
    
    return self;
}

-(UIImage*)getImage
{
    return [self BitmapToUIImage];
}

// 비트맵 이미지를 UIImage로 변환합니다.
-(UIImage*)BitmapToUIImage:(unsigned char *) bitmap BitmapSize:(CGSize)size
{
    // 디바이스의 컬러 스페이스를 생성합니다.
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    // 그래픽 컨택스트를 생성합니다.
    CGContextRef Context = CGBitmapContextCreate (bitmap, size.width, size.height, 8, size.width * 4, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedLast);    CGColorSpaceRelease(colorSpace );
    // 비트맵을 이미지로 랜더링(변환)합니다.
    CGImageRef ref = CGBitmapContextCreateImage(Context);
    // 그래픽 컨텍스르틑 해제합니다.
//    free(CGBitmapContextGetData(Context));
    CGContextRelease(Context);
    UIImage *img = [UIImage imageWithCGImage:ref];
    CFRelease(ref);
    return img;
}

-(UIImage*)BitmapToUIImage
{
    // 디바이스의 컬러 스페이스를 생성합니다.
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    // 그래픽 컨텍스트틑 생성합니다.
    CGContextRef Context = CGBitmapContextCreate (rawImage, imageWidth, imageHeight, 8, imageWidth * 4, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedLast);
    // 컬러 스페이스를 해제합니다.
    CGColorSpaceRelease(colorSpace );
    // 비트맵을 이미지로 랜더링(변환)합니다.
    CGImageRef ref = CGBitmapContextCreateImage(Context);
    CGContextRelease(Context);    // 그래픽 컨텍스트를 해제합니다.
    UIImage *img = [UIImage imageWithCGImage:ref];
    CFRelease(ref);
    return img;
}

#pragma mark -
#pragma mark Image Processing
-(id)getGrayImage
{
    
    for(int y = 0; y < imageHeight; y++) {
        for(int x = 0; x < imageWidth; x++) {
            uint8_t *pRawImage = (uint8_t *) &rawImage[(y * imageWidth + x) * 4];
            // RGB -> GrayScale 공식
            // V = R x 0.299 + G x 0.587 + B x 0.114
            uint32_t gray = 0.299 * pRawImage[RED] + 0.587 * pRawImage[GREEN] + 0.114 * pRawImage[BLUE];
            
            pRawImage[RED] = (unsigned char) gray;
            pRawImage[GREEN] = (unsigned char) gray;
            pRawImage[BLUE] = (unsigned char) gray;
            
        }
    }
    return self;
    
}

-(id)getInverseImage
{
    
    
    for(int y = 0; y < imageHeight; y++) {
        for(int x = 0; x < imageWidth; x++) {
            uint8_t *pRawImage = (uint8_t *) &rawImage[(y * imageWidth + x) * 4];
            
            
            pRawImage[RED] = 255 - pRawImage[RED];
            pRawImage[GREEN] = 255 - pRawImage[GREEN];
            pRawImage[BLUE] = 255 - pRawImage[BLUE];
            
        }
    }
    return self;
    
}

int getOffset(int x, int y, int width, int index) { return y * width * 4 + x * 4 + index;};

-(id)getTrackingImage
{
    
    // 그레이스케일로 변경합니다.
    [self getGrayImage];
    
    int Matrix1[9] = {-1, 0, 1, -2, 0, 2, -1, 0, 1};
    int Matrix2[9] = {-1, -2, -1, 0, 0, 0, 1, 2, 1};
    
    for (int y = 0; y < imageHeight; y++)
        for (int x = 0; x < imageWidth; x++)
        {
            
            int sumr1 = 0, sumr2 = 0;
            int sumg1 = 0, sumg2 = 0;
            int sumb1 = 0, sumb2 = 0;
            
            int offset = 0;
            for (int j = 0; j <= 2; j++)
                for (int i = 0; i <= 2; i++)
                {
                    sumr1 += *(rawImage + getOffset(x+i, y+j, imageWidth, RED)) * Matrix1[offset];
                    sumr2 += *(rawImage + getOffset(x+i, y+j, imageWidth, RED)) * Matrix2[offset];
                    
                    sumg1 += *(rawImage + getOffset(x+i, y+j, imageWidth, GREEN)) * Matrix1[offset];
                    sumg2 += *(rawImage + getOffset(x+i, y+j, imageWidth, GREEN)) * Matrix2[offset];
                    
                    sumb1 += *(rawImage + getOffset(x+i, y+j, imageWidth, BLUE)) * Matrix1[offset];
                    sumb2 += *(rawImage + getOffset(x+i, y+j, imageWidth, BLUE)) * Matrix2[offset];
                    
                    offset++;
                }
            
            
            int sumr = MIN(((ABS(sumr1) + ABS(sumr2)) / 2), 255);
            int sumg = MIN(((ABS(sumg1) + ABS(sumg2)) / 2), 255);
            int sumb = MIN(((ABS(sumb1) + ABS(sumb2)) / 2), 255);
            
            uint8_t *pRawImage = (uint8_t *) &rawImage[(y * imageWidth + x) * 4];

            pRawImage[RED] = (unsigned char) sumr;
            pRawImage[GREEN] = (unsigned char) sumg;
            pRawImage[BLUE] = (unsigned char) sumb;
            pRawImage[ALPHA] = (unsigned char) rawImage[getOffset(x, y, imageWidth, ALPHA)];
        }
    
    return self;
}

#pragma mark -
-(void)DataInit
{
    
    if( rawImage ) {
        free(rawImage);
        rawImage = nil;
    }
}

@end
