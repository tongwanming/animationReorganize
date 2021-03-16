//
//  CombinedCasesAnimationVC.h
//  animationReorganize
//
//  Created by tongwanming on 2021/3/12.
//  Copyright © 2021 侠猫科技. All rights reserved.
//

#import "AnimationViewController.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, CombinationAniType){
    aPath = 0,
    dingding,
    dianzan,
    bezier,
};

@interface CombinedCasesAnimationVC : AnimationViewController

-(instancetype)initWithType:(CombinationAniType)type;

@end

NS_ASSUME_NONNULL_END
