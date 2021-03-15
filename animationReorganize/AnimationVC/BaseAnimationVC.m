//
//  BaseAnimationVC.m
//  animationReorganize
//
//  Created by tongwanming on 2021/3/12.
//  Copyright © 2021 侠猫科技. All rights reserved.
//

#import "BaseAnimationVC.h"

@interface BaseAnimationVC ()

@end

@implementation BaseAnimationVC

- (instancetype)initWithType:(BaseAniType)type {
    self = [super init];
    if (self){
        self.aniType = type;
    }
    return self;
}

//基础动画
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

-(void)btnClickActive:(UIButton *)btn {
    [super btnClickActive:btn];
    switch (self.aniType) {
        case position:
            [self makePositionAnimation];
            break;
        case opacity:
            [self makeOpacityAnimation];
            break;
        case scale:
            [self makeScaleAnimation];
            break;
        case rotate:
            [self makeRotateAnimation];
            break;
        case background:
            [self makeBackgroundAnimation];
            break;
        default:
            break;
    }
}

//背景色变化
-(void)makeBackgroundAnimation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    animation.toValue = (id)[UIColor greenColor].CGColor;
    animation.duration = 1.0f;
    [self.demoView.layer addAnimation:animation forKey:@"backgroundAnimation"];
}

//旋转
-(void)makeRotateAnimation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.toValue = [NSNumber numberWithFloat:M_PI];
    animation.duration = 1.0f;
    [self.demoView.layer addAnimation:animation forKey:@"rotateAnimation"];
}

//缩放
-(void)makeScaleAnimation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    animation.toValue = [NSNumber numberWithFloat:4.0f];
    animation.toValue = [NSNumber numberWithFloat:0.1f];
    animation.duration = 1.0f;
    [self.demoView.layer addAnimation:animation forKey:@"scaleAnimation"];
}


//透明度
-(void)makeOpacityAnimation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = [NSNumber numberWithFloat:1.0f];
    animation.toValue = [NSNumber numberWithFloat:0.5f];
    animation.duration = 1.0f;
    [self.demoView.layer addAnimation:animation forKey:@"opacityAnimation"];
}

//位移
-(void)makePositionAnimation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(44, 84)];
//    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(144, SCREEN_HEIGHT-75)];
    animation.byValue = [NSValue valueWithCGPoint:CGPointMake((SCREEN_WIDTH-88)/2, SCREEN_HEIGHT/2-88)];
    animation.duration = 5.0f;
    [self.demoView.layer addAnimation:animation forKey:@"positionAnimation"];
}

@end
