//
//  GroupAnimationVC.m
//  animationReorganize
//
//  Created by tongwanming on 2021/3/12.
//  Copyright © 2021 侠猫科技. All rights reserved.
//

#import "GroupAnimationVC.h"

@interface GroupAnimationVC ()

@end

@implementation GroupAnimationVC

-(instancetype)initWithType:(GroupAniType)type{
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
            [self someAnimationsActiveInTheSameTime];
            break;
        case path:
            [self makeGoOnAnimation];
            break;
        default:
            break;
    }
}


- (void)someAnimationsActiveInTheSameTime {
    CABasicAnimation *basAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    basAnimation.fromValue = [NSNumber numberWithFloat:0.8f];
    basAnimation.toValue = [NSNumber numberWithFloat:2];
    
    CABasicAnimation *rotateAni = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotateAni.toValue = [NSNumber numberWithFloat:M_PI*4];
    
    CABasicAnimation *animationBg = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    animationBg.toValue = (id)[UIColor blackColor].CGColor;
    [self.demoView.layer addAnimation:animationBg forKey:@"backgroundAnimation"];
    
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
    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[basAnimation, rotateAni, animationBg, animation  ];
    groupAnimation.duration = 6.0f;
    [self.demoView.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
    
}

-(void)makeGoOnAnimation {
    //定义一个动画开始的时间
    CFTimeInterval currentTime = CACurrentMediaTime();
    
    CABasicAnimation *poAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    poAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(50, SCREEN_WIDTH/2)];
    poAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2)];
    poAnimation.duration = 1.0f;
    poAnimation.fillMode = kCAFillModeForwards;
    poAnimation.removedOnCompletion = NO;
    poAnimation.beginTime = currentTime;
    [self.demoView.layer addAnimation:poAnimation forKey:@"po"];
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:0.8f];
    scaleAnimation.toValue = [NSNumber numberWithFloat:2.0f];
    scaleAnimation.duration = 1.0f;
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.removedOnCompletion = NO;
    scaleAnimation.beginTime = currentTime + 1.0f;
    [self.demoView.layer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    
    CABasicAnimation *roteAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    roteAnimation.toValue = [NSNumber numberWithFloat:M_PI*4];
    roteAnimation.duration = 1.0f;
    roteAnimation.fillMode = kCAFillModeForwards;
    roteAnimation.beginTime = currentTime + 2.0f;
    [self.demoView.layer addAnimation:roteAnimation forKey:@"roteAnimation"];
    
}

@end
