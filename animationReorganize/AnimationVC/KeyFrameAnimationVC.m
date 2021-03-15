//
//  KeyFrameAnimationVC.m
//  animationReorganize
//
//  Created by tongwanming on 2021/3/12.
//  Copyright © 2021 侠猫科技. All rights reserved.
//

#import "KeyFrameAnimationVC.h"

@interface KeyFrameAnimationVC ()

@end

@implementation KeyFrameAnimationVC

- (instancetype)initWithType:(BaseAniType)type {
    self = [super init];
    if (self){
        self.aniType = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

-(void)btnClickActive:(UIButton *)btn {
    [super btnClickActive:btn];
    switch (self.aniType) {
        case keyFrame:
            [self makeKeyFrameAnimation];
            break;
        case path:
            [self makePathAnimation];
            break;
        case shake:
            [self makeShakeAnimation];
            break;
        default:
            break;
    }
}

//关键帧动画
-(void)makeKeyFrameAnimation{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value_0 = [NSValue valueWithCGPoint:CGPointMake(50, SCREEN_HEIGHT/2-50)];
    NSValue *value_1 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2-50)];
    NSValue *value_2 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2+50)];
    NSValue *value_3 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2+50)];
    NSValue *value_4 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2-50)];
    NSValue *value_5 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH-50, SCREEN_HEIGHT/2-50)];
    NSValue *value_6 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH-50, SCREEN_HEIGHT/2-100)];
    NSValue *value_7 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2-100)];
    NSValue *value_8 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2-200)];
    NSValue *value_9 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2-200)];
    NSValue *value_10 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2-100)];
    NSValue *value_11 = [NSValue valueWithCGPoint:CGPointMake(50, SCREEN_HEIGHT/2-100)];
    animation.values = [NSArray arrayWithObjects:value_0,value_1,value_2,value_3,value_4,value_5,value_6,value_7,value_8,value_9,value_10,value_11, nil];
    animation.duration = 5.0f;
    [self.demoView.layer addAnimation:animation forKey:@"keyFrameAnimation"];
}

//路径
-(void)makePathAnimation{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2) radius:160 startAngle:0.0f endAngle:M_PI*6 clockwise:YES];
    animation.duration = 6.0f;
    animation.path = path.CGPath;
    [self.demoView.layer addAnimation:animation forKey:@"pathAnimation"];
}

//抖动动画
-(void)makeShakeAnimation{
    CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    NSValue *value_0 = [NSNumber numberWithFloat:-M_PI/4];
    NSValue *value_1 = [NSNumber numberWithFloat:M_PI/4];
    NSValue *value_3 = [NSNumber numberWithFloat:-M_PI/4];
    anima.values = @[value_0,value_1,value_3];
    anima.repeatCount = MAXFLOAT;
    [self.demoView.layer addAnimation:anima forKey:@"shakeAnimation"];
}

@end
