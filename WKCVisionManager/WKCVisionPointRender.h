//
//  WKCVisionPointRender.h
//  AACD
//
//  Created by wkcloveYang on 2020/5/26.
//  Copyright © 2020 wkcloveYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WKCVisionPointRender : NSObject

+ (CGPoint)convertImagePointToViewPointWithImageViewSize:(CGSize)size
                                                    mode:(UIViewContentMode)mode
                                               imageSize:(CGSize)imageSize
                                              imagePoint:(CGPoint)imagePoint;

@end

