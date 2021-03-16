//
//  CombinedCasesAnimationVC.m
//  animationReorganize
//
//  Created by tongwanming on 2021/3/12.
//  Copyright © 2021 侠猫科技. All rights reserved.
//

#import "CombinedCasesAnimationVC.h"

@interface CombinedCasesAnimationVC ()
@property(nonatomic,assign)CombinationAniType aniType;

@end

@implementation CombinedCasesAnimationVC

-(instancetype)initWithType:(CombinationAniType)type{
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



@end
