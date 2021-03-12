//
//  AnimationViewController.m
//  animationReorganize
//
//  Created by tongwanming on 2021/3/12.
//  Copyright © 2021 侠猫科技. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()

@end

@implementation AnimationViewController
-(instancetype)initWithType:(BaseAniType)type {
    self = [super init];
    if (self){
        self.aniType = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    // Do any additional setup after loading the view.
}

- (void)createUI {
    self.demoView = [[UIView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-88)/2, SCREEN_HEIGHT/2-88,88 ,88)];
    self.demoView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.demoView];
    
    UIButton *startBtn = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-60)/2, SCREEN_HEIGHT-80, 80, 30)];
    [startBtn setTitle:@"START" forState:UIControlStateNormal];
    [startBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    startBtn.layer.cornerRadius = 5;
    startBtn.layer.borderWidth = 1;
    startBtn.layer.borderColor = UIColor.orangeColor.CGColor;
    [startBtn addTarget:self action:@selector(btnClickActive:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startBtn];
    
}

-(void)btnClickActive:(UIButton *)btn {
    
}

@end
