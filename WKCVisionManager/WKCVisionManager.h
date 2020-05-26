//
//  WKCVisionManager.h
//  AACD
//
//  Created by wkcloveYang on 2020/5/26.
//  Copyright © 2020 wkcloveYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WKCVisionModel.h"

@interface WKCVisionManager : NSObject


+ (WKCVisionManager *)defaultManager;

- (void)detectFacesWithImage:(UIImage *)image
                  completion:(void(^)(WKCVisionModel * faces, NSError * error))completion;

@end

