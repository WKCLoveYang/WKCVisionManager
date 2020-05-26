//
//  WKCVisionModel.h
//  AACD
//
//  Created by wkcloveYang on 2020/5/26.
//  Copyright © 2020 wkcloveYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface WKCVisionFaceModel : NSObject

// 所有点
@property (nonatomic, strong, readonly) NSArray <NSValue *> * landmarks;


// 左眼(9点钟方向开始, 顺时针转)
@property (nonatomic, strong) NSValue * leftEye0;
@property (nonatomic, strong) NSValue * leftEye1;
@property (nonatomic, strong) NSValue * leftEye2;
@property (nonatomic, strong) NSValue * leftEye3;
@property (nonatomic, strong) NSValue * leftEye4;
@property (nonatomic, strong) NSValue * leftEye5;

// 右眼(3点钟方向开始, 逆时针转)
@property (nonatomic, strong) NSValue * rightEye0;
@property (nonatomic, strong) NSValue * rightEye1;
@property (nonatomic, strong) NSValue * rightEye2;
@property (nonatomic, strong) NSValue * rightEye3;
@property (nonatomic, strong) NSValue * rightEye4;
@property (nonatomic, strong) NSValue * rightEye5;

// 左眉毛(9点钟方向开始, 顺时针转)
@property (nonatomic, strong) NSValue * leftEyebrow0;
@property (nonatomic, strong) NSValue * leftEyebrow1;
@property (nonatomic, strong) NSValue * leftEyebrow2;
@property (nonatomic, strong) NSValue * leftEyebrow3;
@property (nonatomic, strong) NSValue * leftEyebrow4;
@property (nonatomic, strong) NSValue * leftEyebrow5;

// 右眉毛(9点钟方向开始, 顺时针转)
@property (nonatomic, strong) NSValue * rightEyebrow0;
@property (nonatomic, strong) NSValue * rightEyebrow1;
@property (nonatomic, strong) NSValue * rightEyebrow2;
@property (nonatomic, strong) NSValue * rightEyebrow3;
@property (nonatomic, strong) NSValue * rightEyebrow4;
@property (nonatomic, strong) NSValue * rightEyebrow5;

// 左瞳孔
@property (nonatomic, strong) NSValue * leftPupil;

// 右瞳孔
@property (nonatomic, strong) NSValue * rightPupil;

// 鼻子(从两眼间的鼻梁中间开始, 逆时针转)
@property (nonatomic, strong) NSValue * nose0;
@property (nonatomic, strong) NSValue * nose1;
@property (nonatomic, strong) NSValue * nose2;
@property (nonatomic, strong) NSValue * nose3;
@property (nonatomic, strong) NSValue * nose4;
@property (nonatomic, strong) NSValue * nose5;
@property (nonatomic, strong) NSValue * nose6;
@property (nonatomic, strong) NSValue * nose7;

// 鼻子轮廓(与鼻子差不多)
@property (nonatomic, strong) NSValue * noseCrest0;
@property (nonatomic, strong) NSValue * noseCrest1;
@property (nonatomic, strong) NSValue * noseCrest2;
@property (nonatomic, strong) NSValue * noseCrest3;
@property (nonatomic, strong) NSValue * noseCrest4;
@property (nonatomic, strong) NSValue * noseCrest5;

// 中心线(从两眼间的鼻梁中间开始,向下至下巴)
@property (nonatomic, strong) NSValue * medianLine0;
@property (nonatomic, strong) NSValue * medianLine1;
@property (nonatomic, strong) NSValue * medianLine2;
@property (nonatomic, strong) NSValue * medianLine3;
@property (nonatomic, strong) NSValue * medianLine4;
@property (nonatomic, strong) NSValue * medianLine5;
@property (nonatomic, strong) NSValue * medianLine6;
@property (nonatomic, strong) NSValue * medianLine7;
@property (nonatomic, strong) NSValue * medianLine8;
@property (nonatomic, strong) NSValue * medianLine9;

// 外唇(9点钟方向开始, 顺指针转)
@property (nonatomic, strong) NSValue * outerLips0;
@property (nonatomic, strong) NSValue * outerLips1;
@property (nonatomic, strong) NSValue * outerLips2;
@property (nonatomic, strong) NSValue * outerLips3;
@property (nonatomic, strong) NSValue * outerLips4;
@property (nonatomic, strong) NSValue * outerLips5;
@property (nonatomic, strong) NSValue * outerLips6;
@property (nonatomic, strong) NSValue * outerLips7;
@property (nonatomic, strong) NSValue * outerLips8;
@property (nonatomic, strong) NSValue * outerLips9;
@property (nonatomic, strong) NSValue * outerLips10;
@property (nonatomic, strong) NSValue * outerLips11;
@property (nonatomic, strong) NSValue * outerLips12;
@property (nonatomic, strong) NSValue * outerLips13;

// 内唇(方向同外唇)
@property (nonatomic, strong) NSValue * innerLips0;
@property (nonatomic, strong) NSValue * innerLips1;
@property (nonatomic, strong) NSValue * innerLips2;
@property (nonatomic, strong) NSValue * innerLips3;
@property (nonatomic, strong) NSValue * innerLips4;
@property (nonatomic, strong) NSValue * innerLips5;

// 脸轮廓(3点钟方向开始, 顺指针转)
@property (nonatomic, strong) NSValue * faceContour0;
@property (nonatomic, strong) NSValue * faceContour1;
@property (nonatomic, strong) NSValue * faceContour2;
@property (nonatomic, strong) NSValue * faceContour3;
@property (nonatomic, strong) NSValue * faceContour4;
@property (nonatomic, strong) NSValue * faceContour5;
@property (nonatomic, strong) NSValue * faceContour6;
@property (nonatomic, strong) NSValue * faceContour7;
@property (nonatomic, strong) NSValue * faceContour8;
@property (nonatomic, strong) NSValue * faceContour9;
@property (nonatomic, strong) NSValue * faceContour10;
@property (nonatomic, strong) NSValue * faceContour11;
@property (nonatomic, strong) NSValue * faceContour12;
@property (nonatomic, strong) NSValue * faceContour13;
@property (nonatomic, strong) NSValue * faceContour14;
@property (nonatomic, strong) NSValue * faceContour15;
@property (nonatomic, strong) NSValue * faceContour16;

// 两眉毛中间
@property (nonatomic, strong, readonly) NSValue * eyebrowMiddle;
// 左侧脸中心
@property (nonatomic, strong, readonly) NSValue * leftFaceCenter;
// 右侧脸中心
@property (nonatomic, strong, readonly) NSValue * rightFaceCenter;
// 左侧鼻子中心
@property (nonatomic, strong, readonly) NSValue * leftNoseCenter;
//右侧鼻子中心
@property (nonatomic, strong, readonly) NSValue * rightNoseCenter;


@end


@interface WKCVisionModel : NSObject

@property (nonatomic, strong) NSArray <WKCVisionFaceModel *> * faces;

@end

