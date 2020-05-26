//
//  WKCVisionManager.m
//  AACD
//
//  Created by wkcloveYang on 2020/5/26.
//  Copyright © 2020 wkcloveYang. All rights reserved.
//

#import "WKCVisionManager.h"
#import <Vision/Vision.h>


@implementation WKCVisionManager

+ (WKCVisionManager *)defaultManager
{
    static WKCVisionManager * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[WKCVisionManager alloc] init];
    });
    
    return instance;
}



- (void)detectFacesWithImage:(UIImage *)image
                  completion:(void(^)(WKCVisionModel * faces, NSError * error))completion
{
    CIImage * ciimage = [[CIImage alloc] initWithImage:image];
    
    VNImageRequestHandler * requestHandle = [[VNImageRequestHandler alloc] initWithCIImage:ciimage options:@{}];
    
    VNDetectFaceLandmarksRequest * faceRequest = [[VNDetectFaceLandmarksRequest alloc] initWithCompletionHandler:^(VNRequest * _Nonnull request, NSError * _Nullable error) {
        if (error) {
            if (completion) {
                completion(nil, error);
            }
        } else {
            WKCVisionModel * model = [self handleLandmarksWithImage:image
                                                            request:request];
            if (model) {
                if (completion) {
                    completion(model, nil);
                }
            } else {
                if (completion) {
                    completion(nil, error);
                }
            }
        }
    }];
    
    [requestHandle performRequests:@[faceRequest] error:nil];
}


- (WKCVisionModel *)handleLandmarksWithImage:(UIImage *)image
                                     request:(VNRequest *)request
{
    WKCVisionModel * faces = [[WKCVisionModel alloc] init];
    NSMutableArray <WKCVisionFaceModel *>* facesArray = [NSMutableArray array];
    
    NSArray <VNFaceObservation *>* observations = request.results;
    
    for (VNFaceObservation * observation in observations) {
        WKCVisionFaceModel * face = [[WKCVisionFaceModel alloc] init];
        
        VNFaceLandmarks2D * landmarks = observation.landmarks;
        
        VNFaceLandmarkRegion2D * leftEye = landmarks.leftEye;
        NSArray <NSValue *>* leftEyePoints = [self pointsWithImage:image
                                                 landmarksRegion2D:leftEye
                                                          faceRect:observation.boundingBox];
        if (leftEyePoints.count > 0) {
            face.leftEye0 = leftEyePoints[0];
        }
        if (leftEyePoints.count > 1) {
            face.leftEye1 = leftEyePoints[1];
        }
        if (leftEyePoints.count > 2) {
            face.leftEye2 = leftEyePoints[2];
        }
        if (leftEyePoints.count > 3) {
            face.leftEye3 = leftEyePoints[3];
        }
        if (leftEyePoints.count > 4) {
            face.leftEye4 = leftEyePoints[4];
        }
        if (leftEyePoints.count > 5) {
            face.leftEye5 = leftEyePoints[5];
        }
        
        
        VNFaceLandmarkRegion2D * rightEye = landmarks.rightEye;
        NSArray <NSValue *>* rightEyeValues = [self pointsWithImage:image
                                                  landmarksRegion2D:rightEye
                                                           faceRect:observation.boundingBox];
        if (rightEyeValues.count > 0) {
            face.rightEye0 = rightEyeValues[0];
        }
        if (rightEyeValues.count > 1) {
            face.rightEye1 = rightEyeValues[1];
        }
        if (rightEyeValues.count > 2) {
            face.rightEye2 = rightEyeValues[2];
        }
        if (rightEyeValues.count > 3) {
            face.rightEye3 = rightEyeValues[3];
        }
        if (rightEyeValues.count > 4) {
            face.rightEye4 = rightEyeValues[4];
        }
        if (rightEyeValues.count > 5) {
            face.rightEye5 = rightEyeValues[5];
        }
        
        
        VNFaceLandmarkRegion2D *leftEyebrow = landmarks.leftEyebrow;
        NSArray <NSValue *>* leftEyebrowValues = [self pointsWithImage:image
                                                     landmarksRegion2D:leftEyebrow
                                                              faceRect:observation.boundingBox];
        if (leftEyebrowValues.count > 0) {
            face.leftEyebrow0 = leftEyebrowValues[0];
        }
        if (leftEyebrowValues.count > 1) {
            face.leftEyebrow1 = leftEyebrowValues[1];
        }
        if (leftEyebrowValues.count > 2) {
            face.leftEyebrow2 = leftEyebrowValues[2];
        }
        if (leftEyebrowValues.count > 3) {
            face.leftEyebrow3 = leftEyebrowValues[3];
        }
        if (leftEyebrowValues.count > 4) {
            face.leftEyebrow4 = leftEyebrowValues[4];
        }
        if (leftEyebrowValues.count > 5) {
            face.leftEyebrow5 = leftEyebrowValues[5];
        }
        
        
        VNFaceLandmarkRegion2D *rightEyebrow = landmarks.rightEyebrow;
        NSArray <NSValue *>* rightEyebrowValues = [self pointsWithImage:image landmarksRegion2D:rightEyebrow faceRect:observation.boundingBox];
        if (rightEyebrowValues.count > 0) {
            face.rightEyebrow0 = rightEyebrowValues[0];
        }
        if (rightEyebrowValues.count > 1) {
            face.rightEyebrow1 = rightEyebrowValues[1];
        }
        if (rightEyebrowValues.count > 2) {
            face.rightEyebrow2 = rightEyebrowValues[2];
        }
        if (rightEyebrowValues.count > 3) {
            face.rightEyebrow3 = rightEyebrowValues[3];
        }
        if (rightEyebrowValues.count > 4) {
            face.rightEyebrow4 = rightEyebrowValues[4];
        }
        if (rightEyebrowValues.count > 5) {
            face.rightEyebrow5 = rightEyebrowValues[5];
        }
        
        
        VNFaceLandmarkRegion2D *leftPupil = landmarks.leftPupil;
        NSArray <NSValue *>* leftPupilValues = [self pointsWithImage:image
                                                   landmarksRegion2D:leftPupil
                                                            faceRect:observation.boundingBox];
        if (leftPupilValues.count > 0) {
            face.leftPupil = leftPupilValues[0];
        }
        
        
        VNFaceLandmarkRegion2D *rightPupil = landmarks.rightPupil;
        NSArray <NSValue *>* rightPupilValues = [self pointsWithImage:image
                                                    landmarksRegion2D:rightPupil
                                                             faceRect:observation.boundingBox];
        if (rightPupilValues.count > 0) {
            face.rightPupil = rightPupilValues[0];
        }
        
        
        VNFaceLandmarkRegion2D *nose = landmarks.nose;
        NSArray <NSValue *>* noseValues = [self pointsWithImage:image
                                              landmarksRegion2D:nose
                                                       faceRect:observation.boundingBox];
        if (noseValues.count > 0) {
            face.nose0 = noseValues[0];
        }
        if (noseValues.count > 1) {
            face.nose1 = noseValues[1];
        }
        if (noseValues.count > 2) {
            face.nose2 = noseValues[2];
        }
        if (noseValues.count > 3) {
            face.nose3 = noseValues[3];
        }
        if (noseValues.count > 4) {
            face.nose4 = noseValues[4];
        }
        if (noseValues.count > 5) {
            face.nose5 = noseValues[5];
        }
        if (noseValues.count > 6) {
            face.nose6 = noseValues[6];
        }
        if (noseValues.count > 7) {
            face.nose7 = noseValues[7];
        }
        
        
        VNFaceLandmarkRegion2D *noseCrest = landmarks.noseCrest;
        NSArray <NSValue *>* noseCrestValues = [self pointsWithImage:image
                                                   landmarksRegion2D:noseCrest
                                                            faceRect:observation.boundingBox];
        if (noseCrestValues.count > 0) {
            face.noseCrest0 = noseCrestValues[0];
        }
        if (noseCrestValues.count > 1) {
            face.noseCrest1 = noseCrestValues[1];
        }
        if (noseCrestValues.count > 2) {
            face.noseCrest2 = noseCrestValues[2];
        }
        if (noseCrestValues.count > 3) {
            face.noseCrest3 = noseCrestValues[3];
        }
        if (noseCrestValues.count > 4) {
            face.noseCrest4 = noseCrestValues[4];
        }
        if (noseCrestValues.count > 5) {
            face.noseCrest5 = noseCrestValues[5];
        }
        
        
        VNFaceLandmarkRegion2D * medianLine = landmarks.medianLine;
        NSArray <NSValue *>* medianLineValues = [self pointsWithImage:image
                                                    landmarksRegion2D:medianLine
                                                             faceRect:observation.boundingBox];
        if (medianLineValues.count > 0) {
            face.medianLine0 = medianLineValues[0];
        }
        if (medianLineValues.count > 1) {
            face.medianLine1 = medianLineValues[1];
        }
        if (medianLineValues.count > 2) {
            face.medianLine2 = medianLineValues[2];
        }
        if (medianLineValues.count > 3) {
            face.medianLine3 = medianLineValues[3];
        }
        if (medianLineValues.count > 4) {
            face.medianLine4 = medianLineValues[4];
        }
        if (medianLineValues.count > 5) {
            face.medianLine5 = medianLineValues[5];
        }
        if (medianLineValues.count > 6) {
            face.medianLine6 = medianLineValues[6];
        }
        if (medianLineValues.count > 7) {
            face.medianLine7 = medianLineValues[7];
        }
        if (medianLineValues.count > 8) {
            face.medianLine8 = medianLineValues[8];
        }
        if (medianLineValues.count > 9) {
            face.medianLine9 = medianLineValues[9];
        }
        
        
        VNFaceLandmarkRegion2D * outerLips = landmarks.outerLips;
        NSArray <NSValue *>* outerLipsValues = [self pointsWithImage:image
                                                   landmarksRegion2D:outerLips
                                                            faceRect:observation.boundingBox];
        if (outerLipsValues.count > 0) {
            face.outerLips0 = outerLipsValues[0];
        }
        if (outerLipsValues.count > 1) {
            face.outerLips1 = outerLipsValues[1];
        }
        if (outerLipsValues.count > 2) {
            face.outerLips2 = outerLipsValues[2];
        }
        if (outerLipsValues.count > 3) {
            face.outerLips3 = outerLipsValues[3];
        }
        if (outerLipsValues.count > 4) {
            face.outerLips4 = outerLipsValues[4];
        }
        if (outerLipsValues.count > 5) {
            face.outerLips5 = outerLipsValues[5];
        }
        if (outerLipsValues.count > 6) {
            face.outerLips6 = outerLipsValues[6];
        }
        if (outerLipsValues.count > 7) {
            face.outerLips7 = outerLipsValues[7];
        }
        if (outerLipsValues.count > 8) {
            face.outerLips8 = outerLipsValues[8];
        }
        if (outerLipsValues.count > 9) {
            face.outerLips9 = outerLipsValues[9];
        }
        if (outerLipsValues.count > 10) {
            face.outerLips10 = outerLipsValues[10];
        }
        if (outerLipsValues.count > 11) {
            face.outerLips11 = outerLipsValues[11];
        }
        if (outerLipsValues.count > 12) {
            face.outerLips12 = outerLipsValues[12];
        }
        if (outerLipsValues.count > 13) {
            face.outerLips13 = outerLipsValues[13];
        }
        
        
        VNFaceLandmarkRegion2D * innerLips = landmarks.innerLips;
        NSArray <NSValue *>* innerLipsValues = [self pointsWithImage:image
                                                   landmarksRegion2D:innerLips
                                                            faceRect:observation.boundingBox];
        if (innerLipsValues.count > 0) {
            face.innerLips0 = innerLipsValues[0];
        }
        if (innerLipsValues.count > 1) {
            face.innerLips1 = innerLipsValues[1];
        }
        if (innerLipsValues.count > 2) {
            face.innerLips2 = innerLipsValues[2];
        }
        if (innerLipsValues.count > 3) {
            face.innerLips3 = innerLipsValues[3];
        }
        if (innerLipsValues.count > 4) {
            face.innerLips4 = innerLipsValues[4];
        }
        if (innerLipsValues.count > 5) {
            face.innerLips5 = innerLipsValues[5];
        }
        
        
        VNFaceLandmarkRegion2D * faceContour = landmarks.faceContour;
        NSArray <NSValue *>* faceContourValues = [self pointsWithImage:image
                                                     landmarksRegion2D:faceContour
                                                              faceRect:observation.boundingBox];
        if (faceContourValues.count > 0) {
            face.faceContour0 = faceContourValues[0];
        }
        if (faceContourValues.count > 1) {
            face.faceContour1 = faceContourValues[1];
        }
        if (faceContourValues.count > 2) {
            face.faceContour2 = faceContourValues[2];
        }
        if (faceContourValues.count > 3) {
            face.faceContour3 = faceContourValues[3];
        }
        if (faceContourValues.count > 4) {
            face.faceContour4 = faceContourValues[4];
        }
        if (faceContourValues.count > 5) {
            face.faceContour5 = faceContourValues[5];
        }
        if (faceContourValues.count > 6) {
            face.faceContour6 = faceContourValues[6];
        }
        if (faceContourValues.count > 7) {
            face.faceContour7 = faceContourValues[7];
        }
        if (faceContourValues.count > 8) {
            face.faceContour8 = faceContourValues[8];
        }
        if (faceContourValues.count > 9) {
            face.faceContour9 = faceContourValues[9];
        }
        if (faceContourValues.count > 10) {
            face.faceContour10 = faceContourValues[10];
        }
        if (faceContourValues.count > 11) {
            face.faceContour11 = faceContourValues[11];
        }
        if (faceContourValues.count > 12) {
            face.faceContour12 = faceContourValues[12];
        }
        if (faceContourValues.count > 13) {
            face.faceContour13 = faceContourValues[13];
        }
        if (faceContourValues.count > 14) {
            face.faceContour14 = faceContourValues[14];
        }
        if (faceContourValues.count > 15) {
            face.faceContour15 = faceContourValues[15];
        }
        if (faceContourValues.count > 16) {
            face.faceContour16 = faceContourValues[16];
        }
        
        [facesArray addObject:face];
    }
    
    faces.faces = facesArray.mutableCopy;
    
    return faces;
}




- (NSArray <NSValue *>*)pointsWithImage:(UIImage *)image
                      landmarksRegion2D:(VNFaceLandmarkRegion2D *)landmarksRegion2D
                               faceRect:(CGRect)faceRect
{
    NSMutableArray <NSValue *>* array = [NSMutableArray array];
    
    for (int i = 0; i < landmarksRegion2D.pointCount; i ++) {
        CGPoint point = landmarksRegion2D.normalizedPoints[i];
        CGPoint pointForImage = [self pointTranslateWithImage:image
                                                     faceRect:faceRect
                                                landmarkPoint:point];
        [array addObject:[NSValue valueWithCGPoint:pointForImage]];
    }
    
    return array;
}


- (CGPoint)pointTranslateWithImage:(UIImage *)image
                          faceRect:(CGRect)faceRect
                     landmarkPoint:(CGPoint)landmarkPoint
{
    CGFloat width = image.size.width * faceRect.size.width;
    CGFloat height = image.size.height * faceRect.size.height;
    CGFloat x = landmarkPoint.x * width + faceRect.origin.x * image.size.width;
    CGFloat y = image.size.height - (landmarkPoint.y * height + faceRect.origin.y * image.size.height);
    return CGPointMake(x, y);
}

@end
