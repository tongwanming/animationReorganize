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
    
    self.startBtn = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-60)/2, SCREEN_HEIGHT-80, 80, 30)];
    [self.startBtn setTitle:@"START" forState:UIControlStateNormal];
    [self.startBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    self.startBtn.layer.cornerRadius = 5;
    self.startBtn.layer.borderWidth = 1;
    self.startBtn.layer.borderColor = UIColor.orangeColor.CGColor;
    [self.startBtn addTarget:self action:@selector(btnClickActive:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.startBtn];
    
}

-(void)btnClickActive:(UIButton *)btn {
    
}

@end
