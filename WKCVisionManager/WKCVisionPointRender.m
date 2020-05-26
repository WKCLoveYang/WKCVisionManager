//
//  WKCVisionPointRender.m
//  AACD
//
//  Created by wkcloveYang on 2020/5/26.
//  Copyright © 2020 wkcloveYang. All rights reserved.
//

#import "WKCVisionPointRender.h"

@implementation WKCVisionPointRender

+ (CGPoint)convertImagePointToViewPointWithImageViewSize:(CGSize)size
                                                    mode:(UIViewContentMode)mode
                                               imageSize:(CGSize)imageSize
                                              imagePoint:(CGPoint)imagePoint
{
    CGFloat imageViewWidth = size.width;
    CGFloat imageViewHeight = size.height;
    CGFloat imageWidth = imageSize.width;
    CGFloat imageHeight = imageSize.height;
    
    CGFloat x = 0, y = 0;
    
    if (mode == UIViewContentModeScaleAspectFit) {
        if (imageHeight / imageWidth < imageViewHeight / imageViewWidth) {
            x = imagePoint.x / imageWidth * imageViewWidth;
            CGFloat imageNewHeight = imageHeight / imageWidth * imageViewWidth;
            y = (imageViewHeight - imageNewHeight) / 2.0 + imagePoint.y / imageHeight * imageNewHeight;
        } else {
            y = imagePoint.y / imageHeight * imageViewHeight;
            CGFloat imageNewWidth = imageWidth / imageHeight * imageViewHeight;
            x = (imageViewWidth - imageNewWidth) / 2.0 + imagePoint.x / imageWidth * imageNewWidth;
        }
    } else {
        if (imageHeight / imageWidth < imageViewHeight / imageViewWidth) {
            y = imagePoint.y / imageHeight * imageViewHeight;
            CGFloat imageNewWidth = imageWidth / imageHeight * imageViewHeight;
            x = (imageViewWidth - imageNewWidth) / 2.0 + imagePoint.x / imageWidth * imageNewWidth;
        } else {
            x = imagePoint.x / imageWidth * imageViewWidth;
            CGFloat imageNewHeight = imageHeight / imageWidth * imageViewWidth;
            y = (imageViewHeight - imageNewHeight) / 2.0 + imagePoint.y / imageHeight * imageNewHeight;
        }
    }
    
    CGPoint translatePoint = CGPointMake(x, y);
    return translatePoint;
}

@end
