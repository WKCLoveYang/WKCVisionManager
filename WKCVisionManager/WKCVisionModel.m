//
//  WKCVisionModel.m
//  AACD
//
//  Created by wkcloveYang on 2020/5/26.
//  Copyright © 2020 wkcloveYang. All rights reserved.
//

#import "WKCVisionModel.h"

@implementation WKCVisionFaceModel

- (NSArray<NSValue *> *)landmarks
{
    return @[
        self.leftEye0, self.leftEye1, self.leftEye2, self.leftEye3,
        self.leftEye4, self.leftEye5, self.rightEye0, self.rightEye1,
        self.rightEye2, self.rightEye3, self.rightEye4, self.rightEye5,
        self.leftEyebrow0, self.leftEyebrow1, self.leftEyebrow2,
        self.leftEyebrow3, self.leftEyebrow4, self.leftEyebrow5,
        self.rightEyebrow0, self.rightEyebrow1, self.rightEyebrow2,
        self.rightEyebrow3, self.rightEyebrow4, self.rightEyebrow5,
        self.leftPupil, self.rightPupil, self.nose0,
        self.nose1, self.nose2, self.nose3,
        self.nose4, self.nose5, self.nose6,
        self.nose7, self.noseCrest0, self.noseCrest1,
        self.noseCrest2, self.noseCrest3, self.noseCrest4,
        self.noseCrest5, self.medianLine0, self.medianLine1,
        self.medianLine2, self.medianLine3, self.medianLine4,
        self.medianLine5, self.medianLine6, self.medianLine7,
        self.medianLine8, self.medianLine9, self.outerLips0,
        self.outerLips1, self.outerLips2, self.outerLips3,
        self.outerLips4, self.outerLips5, self.outerLips6,
        self.outerLips7, self.outerLips8, self.outerLips9,
        self.outerLips10, self.outerLips11, self.outerLips12,
        self.outerLips13, self.innerLips0, self.innerLips1,
        self.innerLips2, self.innerLips3, self.innerLips4,
        self.innerLips5, self.faceContour0, self.faceContour1,
        self.faceContour2, self.faceContour3, self.faceContour4,
        self.faceContour5, self.faceContour6, self.faceContour7,
        self.faceContour8, self.faceContour9, self.faceContour10,
        self.faceContour11, self.faceContour12, self.faceContour12,
        self.faceContour13, self.faceContour14, self.faceContour15,
        self.faceContour16, self.eyebrowMiddle, self.leftFaceCenter,
        self.rightFaceCenter, self.leftNoseCenter, self.rightNoseCenter
    ];
}

- (NSValue *)eyebrowMiddle
{
    CGPoint leftEyebrow3Point = [self.leftEyebrow3 CGPointValue];
    CGPoint rightEyebrow3Point = [self.rightEyebrow3 CGPointValue];
    CGPoint eyebrowMiddlePoint = CGPointMake((leftEyebrow3Point.x + rightEyebrow3Point.x) / 2.0, (leftEyebrow3Point.y + rightEyebrow3Point.y) / 2.0);
    return [NSValue valueWithCGPoint:eyebrowMiddlePoint];
}

- (NSValue *)leftFaceCenter
{
    CGPoint leftEye0Point = [self.leftEye0 CGPointValue];
    CGPoint outerLips0Point = [self.outerLips0 CGPointValue];
    CGPoint leftFaceCenterPoint = CGPointMake((leftEye0Point.x + outerLips0Point.x) / 2.0, (leftEye0Point.y + outerLips0Point.y) / 2.0);
    return [NSValue valueWithCGPoint:leftFaceCenterPoint];
}

- (NSValue *)rightFaceCenter
{
    CGPoint eyebrowMiddlePoint = [self.eyebrowMiddle CGPointValue];
    CGPoint nose6Point = [self.nose6 CGPointValue];
    CGPoint rightFaceCenterPoint = CGPointMake((eyebrowMiddlePoint.x + nose6Point.x) / 2.0, (eyebrowMiddlePoint.y + nose6Point.y) / 2.0);
    return [NSValue valueWithCGPoint:rightFaceCenterPoint];
}

- (NSValue *)leftNoseCenter
{
    CGPoint eyebrowMiddlePoint = [self.eyebrowMiddle CGPointValue];
    CGPoint nose2Point = [self.nose2 CGPointValue];
    CGPoint leftNoseCenterPoint = CGPointMake((eyebrowMiddlePoint.x + nose2Point.x) / 2.0, (eyebrowMiddlePoint.y + nose2Point.y) / 2.0);
    return [NSValue valueWithCGPoint:leftNoseCenterPoint];
}

- (NSValue *)rightNoseCenter
{
    CGPoint eyebrowMiddlePoint = [self.eyebrowMiddle CGPointValue];
    CGPoint nose6Point = [self.nose6 CGPointValue];
    CGPoint rightNoseCenterPoint = CGPointMake((eyebrowMiddlePoint.x + nose6Point.x) / 2.0, (eyebrowMiddlePoint.y + nose6Point.y) / 2.0);
    return [NSValue valueWithCGPoint:rightNoseCenterPoint];
}

@end



@implementation WKCVisionModel

@end
