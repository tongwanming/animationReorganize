//
//  AnimationViewController.h
//  animationReorganize
//
//  Created by tongwanming on 2021/3/12.
//  Copyright © 2021 侠猫科技. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, BaseAniType){
    position = 0,
    opacity,
    scale,
    rotate,
    background
};

typedef NS_ENUM(NSInteger, KeyAniType){
    keyFrame = 0,
    path,
    shake
};

typedef NS_ENUM(NSInteger, GroupAniType){
    sameTime = 0,
    goOn
};

typedef NS_ENUM(NSInteger, TransitionAniType){
    fade = 0,
    moveIn,
    push,
    reveal,
    cube,
    suck,
    oglFile,
    ripple,
    curl,
    unCurl,
    caOpen,
    caClose
};

@interface AnimationViewController : BaseViewController
-(instancetype)initWithType:(BaseAniType)type;

@end

NS_ASSUME_NONNULL_END
