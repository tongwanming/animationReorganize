//
//  TransitionAnimationVC.m
//  animationReorganize
//
//  Created by tongwanming on 2021/3/12.
//  Copyright © 2021 侠猫科技. All rights reserved.
//

#import "TransitionAnimationVC.h"

@interface TransitionAnimationVC ()



@end

@implementation TransitionAnimationVC

-(instancetype)initWithType:(GroupAniType)type {
    self = [super init];
    if (self){
        self.aniType = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.startBtn setHidden:YES];
    [self createUISub];
    
    // Do any additional setup after loading the view.
}

- (void)createUISub{
    NSArray *names =@[@"fade",@"moveIn",@"push",@"reveal",@"cube",@"suck",@"oglFile",@"ripple",@"curl",@"unCurl",@"caOpen",@"caClose",];
    CGFloat widtn = SCREEN_WIDTH/6;
    CGFloat height = 40;
    for (int i = 0; i < names.count; i++) {
        UIButton *b = [UIButton buttonWithType:UIButtonTypeSystem];
        b.tag = 1000+i;
        b.layer.cornerRadius = 5;
        b.layer.borderWidth = 1;
        b.layer.borderColor = UIColor.orangeColor.CGColor;
        if (@available(iOS 14.0, *)) {
            [b setTitle:names[i] forState:UIControlStateNormal];
        } else {
            // Fallback on earlier versions
            [b setTitle:names[i] forState: UIControlStateNormal];
        }
        if (i > 5) {
            b.frame = CGRectMake((i-6)*widtn, SCREEN_HEIGHT*2/3 + height*1.5, widtn - 5, height);
        } else {
            b.frame = CGRectMake(i*widtn, SCREEN_HEIGHT*2/3, widtn - 5, height);
        }
        [b addTarget:self action:@selector(btnShowActive:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:b];
    }
}

- (void)btnShowActive:(UIButton *)btn {
    
    NSLog(@"tag==:%ld",(long)btn.tag);
    [self changeColorActive];
    switch (btn.tag) {
            //fade
        case 1000:{
            dispatch_async(dispatch_get_main_queue(), ^{

                CATransition *t = [CATransition animation];
                t.type = kCATransitionFade;
                t.duration = 2.0f;
                [self.demoView.layer addAnimation:t forKey:@"fadeAnimation"];
                
            });

        break;}
        case 1001:{
            dispatch_async(dispatch_get_main_queue(), ^{
                CATransition *transitionAni = [CATransition animation];
                transitionAni.type = kCATransitionMoveIn;
                transitionAni.subtype = kCATransitionFromRight;
                transitionAni.duration = 3.0f;
                [self.demoView.layer addAnimation:transitionAni forKey:@"moveInAnimation"];
            });
            break;}
        case 1002:{
            dispatch_async(dispatch_get_main_queue(), ^{
                CATransition *transitionAni = [CATransition animation];
                transitionAni.type = kCATransitionPush;
                transitionAni.subtype = kCATransitionFromRight;
                transitionAni.duration = 1.0f;
                [self.demoView.layer addAnimation:transitionAni forKey:@"pushAnimation"];

            });
            break;}
        case 1003:{
            dispatch_async(dispatch_get_main_queue(), ^{
                CATransition *transitionAni = [CATransition animation];
                transitionAni.type = kCATransitionReveal;
                transitionAni.subtype = kCATransitionFromRight;
                transitionAni.duration = 1.0f;
                [self.demoView.layer addAnimation:transitionAni forKey:@"revealAnimation"];
                
            });
            break;
        }
           
        case 1004:{
            dispatch_async(dispatch_get_main_queue(), ^{
                CATransition *transitionAni = [CATransition animation];
                transitionAni.type = @"cube";
                transitionAni.subtype = kCATransitionFromRight;
                transitionAni.duration = 1.0f;
                [self.demoView.layer addAnimation:transitionAni forKey:@"cubeAnimation"];
                
            });
            break;
        }
            
        case 1005:{
            dispatch_async(dispatch_get_main_queue(), ^{
                CATransition *transitionAni = [CATransition animation];
                transitionAni.type = @"suckEffect";
                transitionAni.subtype = kCATransitionFromRight;
                transitionAni.duration = 1.0f;
                [self.demoView.layer addAnimation:transitionAni forKey:@"suckAnimation"];
            });
            break;}
        case 1006:{
            dispatch_async(dispatch_get_main_queue(), ^{
                CATransition *transitionAni = [CATransition animation];
                transitionAni.type = @"oglFlip";
                transitionAni.subtype = kCATransitionFromRight;
                transitionAni.duration = 1.0f;
                [self.demoView.layer addAnimation:transitionAni forKey:@"oglFileAnimation"];
            });
            break;}
        case 1007:{
            dispatch_async(dispatch_get_main_queue(), ^{
                CATransition *transitionAni = [CATransition animation];
                transitionAni.type = @"rippleEffect";
                transitionAni.subtype = kCATransitionFromRight;
                transitionAni.duration = 1.0f;
                [self.demoView.layer addAnimation:transitionAni forKey:@"rippleAnimation"];
            });
            break;}
        case 1008:{
            dispatch_async(dispatch_get_main_queue(), ^{
                CATransition *transitionAni = [CATransition animation];
                transitionAni.type = @"pageCurl";
                transitionAni.subtype = kCATransitionFromRight;
                transitionAni.duration = 1.0f;
                [self.demoView.layer addAnimation:transitionAni forKey:@"curlAnimation"];
            });
            break;}
        case 1009:{
            dispatch_async(dispatch_get_main_queue(), ^{
                CATransition *transitionAni = [CATransition animation];
                transitionAni.type = @"pageUnCurl";
                transitionAni.subtype = kCATransitionFromTop;
                transitionAni.duration = 1.0f;
                [self.demoView.layer addAnimation:transitionAni forKey:@"unCurlAnimation"];
            });
            break;}
        case 1010:{
            dispatch_async(dispatch_get_main_queue(), ^{
                CATransition *transitionAni = [CATransition animation];
                transitionAni.type = @"cameraIrisHollowOpen";
                transitionAni.subtype = kCATransitionFromRight;
                transitionAni.duration = 1.0f;
                [self.demoView.layer addAnimation:transitionAni forKey:@"caOpenAnimation"];
            });
            break;}
        case 1011:{
            dispatch_async(dispatch_get_main_queue(), ^{
                CATransition *transitionAni = [CATransition animation];
                transitionAni.type = @"cameraIrisHollowClose";
                transitionAni.subtype = kCATransitionFromRight;
                transitionAni.duration = 2.0f;
                [self.demoView.layer addAnimation:transitionAni forKey:@"caCloseAnimation"];
            });
            break;}
            
        default:
            break;
    }
}

- (void)changeColorActive {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.demoView.backgroundColor == [UIColor purpleColor]) {
            self.demoView.backgroundColor = [UIColor orangeColor];
        } else {
            self.demoView.backgroundColor = [UIColor purpleColor];
        }
    });
}

@end
