//
//  WKCVisionImageView.h
//  AACD
//
//  Created by wkcloveYang on 2020/6/2.
//  Copyright © 2020 wkcloveYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WKCVisionManager.h"

@interface WKCVisionImageView : UIImageView

/// 原图
@property (nonatomic, strong) UIImage * originImg;
/// 点颜色(默认白色)
@property (nonatomic, strong) UIColor * pointColor;
/// 点大小(默认(8,8))
@property (nonatomic, assign) CGSize pointSize;
/// 线颜色(默认白色)
@property (nonatomic, strong) UIColor * lineColor;
/// 线宽(默认2)
@property (nonatomic, assign) CGFloat lineWidth;
/// 画线时间(默认1s)
@property (nonatomic, assign) NSTimeInterval lineAnimatDuration;
/// 是否画点(默认YES)
@property (nonatomic, assign) BOOL shouldDrawPoints;
/// 是否闪烁(默认YES)
@property (nonatomic, assign) BOOL shouldShine;
/// 闪烁时间(默认1s)
@property (nonatomic, assign) NSTimeInterval shineAnimationDuration;
/// 结束回调
@property (nonatomic, copy) void(^completionBlock)(void);

/// 画线
/// @param face WKCVisionFaceModel对象
- (void)startDrawWithFace:(WKCVisionFaceModel *)face;

// 停止
- (void)stopDraw;

/// 点内容(重写自定义)
/// @param face face
- (NSArray <NSValue *> *)filterPointsWithFace:(WKCVisionFaceModel *)face;

/// 线内容(重写自定义)
/// @param face face
- (NSArray <NSArray <NSValue *> *> *)filterLinesWithFace:(WKCVisionFaceModel *)face;

@end

