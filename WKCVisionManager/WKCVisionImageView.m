//
//  WKCVisionImageView.m
//  AACD
//
//  Created by wkcloveYang on 2020/6/2.
//  Copyright © 2020 wkcloveYang. All rights reserved.
//

#import "WKCVisionImageView.h"
#import "WKCVisionPointRender.h"

@interface WKCVisionImageView()

@property (nonatomic, strong) NSMutableArray <UIView *>* pointsArray;
@property (nonatomic, strong) NSMutableArray <CAShapeLayer *>* linesArray;

@end

@implementation WKCVisionImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.hidden = YES;
        self.contentMode = UIViewContentModeScaleAspectFit;
        _pointColor = [UIColor whiteColor];
        _pointSize = CGSizeMake(8, 8);
        _lineColor = [UIColor whiteColor];
        _lineWidth = 2;
        _lineAnimatDuration = 1;
        _shineAnimationDuration = 1;
        _shouldShine = YES;
        _shouldDrawPoints = YES;
    }
    
    return self;
}


- (void)startDrawWithFace:(WKCVisionFaceModel *)face
{
    self.hidden = NO;
    _pointsArray = [NSMutableArray array];
    _linesArray = [NSMutableArray array];
    if (_shouldDrawPoints) {
        [self createPointsWithFace:face];
    }
    [self createLineWithFace:face];
    
    if (self.completionBlock) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((_lineAnimatDuration + _shineAnimationDuration * 4) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self removeAllAnimations];
            self.completionBlock();
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self stopDraw];
            });
        });
    }
}

- (void)stopDraw
{
    [self removeAllPoints];
    [self removeLine];
    self.hidden = YES;
}


#pragma mark -InnerMethod
- (CGPoint)translatePointWithImagePoint:(CGPoint)imagePoint
{
    return [WKCVisionPointRender convertImagePointToViewPointWithImageViewSize:self.bounds.size mode:self.contentMode imageSize:_originImg.size imagePoint:imagePoint];
}

- (CABasicAnimation *)createLineAnimation
{
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.removedOnCompletion = NO;
    animation.duration = _lineAnimatDuration;
    animation.fillMode = kCAFillModeForwards;
    animation.beginTime = CACurrentMediaTime() + 0;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.autoreverses = NO;
    animation.fromValue = @(0);
    animation.toValue = @(1);
    return animation;
}

- (CABasicAnimation *)createLineShineAnimation
{
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.removedOnCompletion = NO;
    animation.duration = _shineAnimationDuration;
    animation.repeatCount = MAXFLOAT;
    animation.fillMode = kCAFillModeForwards;
    animation.beginTime = CACurrentMediaTime() + _lineAnimatDuration;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.autoreverses = YES;
    animation.fromValue = @(1);
    animation.toValue = @(0);
    return animation;
}

- (void)removeAllAnimations
{
    for (CAShapeLayer * lineLayer in _linesArray) {
        [lineLayer removeAllAnimations];
    }
}

#pragma mark - Points
- (void)createPointsWithFace:(WKCVisionFaceModel *)face
{
    NSArray <NSValue *> * points = [self filterPointsWithFace:face];
    for (NSValue * imagePoint in points) {
        UIView * pointView = [self createAPointAtImagePoint:imagePoint];
        [_pointsArray addObject:pointView];
        [self addSubview:pointView];
    }
}

- (UIView *)createAPointAtImagePoint:(NSValue *)imagePoint
{
    CGPoint viewPoint = [self translatePointWithImagePoint:[imagePoint CGPointValue]];
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _pointSize.width, _pointSize.height)];
    view.layer.cornerRadius = _pointSize.width / 2.0;
    view.layer.masksToBounds = YES;
    view.backgroundColor = _pointColor;
    view.center = viewPoint;
    
    return view;
}

- (void)removeAllPoints
{
    for (UIView * point in _pointsArray) {
        [point removeFromSuperview];
    }
    [_pointsArray removeAllObjects];
}

- (NSArray <NSValue *> *)filterPointsWithFace:(WKCVisionFaceModel *)face
{
    return @[
        // 鼻梁两个点
        face.medianLine0, face.medianLine3,
        // 左右眉毛
        face.leftEyebrow0, face.rightEyebrow0,
        // 左右眼
        face.leftEye1, face.rightEye1,
        // 嘴角
        face.outerLips13, face.outerLips7,
        // 脸轮廓
        face.faceContour0, face.faceContour2, face.faceContour6,
        face.faceContour8, face.faceContour10, face.faceContour14,
        face.faceContour16
    ];
}


#pragma mark - Lines
- (void)createLineWithFace:(WKCVisionFaceModel *)face
{
    NSArray <NSArray <NSValue *> *> * lines = [self filterLinesWithFace:face];
    for (NSArray * line in lines) {
        [self createALineWithImagePoints:line];
    }
}

- (void)createALineWithImagePoints:(NSArray <NSValue *>*)imagePoints
{
    UIBezierPath * bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:[self translatePointWithImagePoint:[imagePoints.firstObject CGPointValue]]];
    for (int i = 1; i < imagePoints.count; i ++) {
        [bezierPath addLineToPoint:[self translatePointWithImagePoint:[imagePoints[i] CGPointValue]]];
    }
    
    CAShapeLayer * lineLayer = [CAShapeLayer layer];
    lineLayer.backgroundColor = [UIColor clearColor].CGColor;
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    lineLayer.strokeColor = _lineColor.CGColor;
    lineLayer.lineWidth = _lineWidth;
    lineLayer.lineCap = kCALineCapRound;
    lineLayer.lineJoin = kCALineJoinRound;
    lineLayer.path = bezierPath.CGPath;
    
    [self.layer addSublayer:lineLayer];
    [_linesArray addObject:lineLayer];
    
    [lineLayer addAnimation:[self createLineAnimation] forKey:nil];
    if (_shouldShine) {
        [lineLayer addAnimation:[self createLineShineAnimation] forKey:nil];
    }
}

- (void)removeLine
{
    for (CAShapeLayer * lineLayer in _linesArray) {
        [lineLayer removeFromSuperlayer];
        [lineLayer removeAllAnimations];
    }
    
    [_linesArray removeAllObjects];
}

- (NSArray <NSArray <NSValue *> *> *)filterLinesWithFace:(WKCVisionFaceModel *)face
{
    return @[
        // 右半边脸
        @[face.faceContour0, face.rightEyebrow0, face.rightEyebrow1, face.medianLine0],
        @[face.faceContour0, face.faceContour2, face.faceContour6,
        face.faceContour8],
        @[face.rightEye1, face.rightEye0, face.faceContour0],
        @[face.rightEye1, face.rightEye4, face.rightEye5, face.rightEye0],
        @[face.rightEyebrow1, face.rightEye4, face.nose6],
        @[face.faceContour0, face.outerLips7],
        
        // 左半边脸
        @[face.faceContour16, face.leftEyebrow0, face.leftEyebrow1, face.medianLine0],
        @[face.faceContour16, face.faceContour14, face.faceContour10, face.faceContour8],
        @[face.leftEye1, face.leftEye0, face.faceContour16],
        @[face.leftEye1, face.leftEye4, face.leftEye5, face.leftEye0],
        @[face.leftEyebrow1, face.leftEye4, face.nose2],
        @[face.faceContour16, face.outerLips13],
        
        // 中间部分
        @[face.medianLine0, face.nose2, face.outerLips13, face.faceContour10],
        @[face.medianLine0, face.nose6, face.outerLips7, face.faceContour6],
        @[face.medianLine3, face.nose2],
        @[face.medianLine3, face.nose6],
        @[face.nose2, face.nose6],
        @[face.outerLips13, face.outerLips10, face.faceContour6],
        @[face.outerLips7, face.outerLips10, face.faceContour10]
    ];
}


@end
