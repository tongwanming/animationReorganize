//
//  ViewController.m
//  animationReorganize
//
//  Created by tongwanming on 2021/3/12.
//  Copyright © 2021 侠猫科技. All rights reserved.
//

#import "ViewController.h"
#import "BaseAnimationVC.h"
#import "KeyFrameAnimationVC.h"
#import "GroupAnimationVC.h"
#import "TransitionAnimationVC.h"
#import "CombinedCasesAnimationVC.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>{
    UITableView *_tabView;
    NSArray *_dataArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"iOS动画浅谈";
    
    [self createUI];
    [self dealData];
    
    // Do any additional setup after loading the view, typically from a nib.
}

//创建界面
- (void)createUI {
    _tabView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStyleGrouped];
    _tabView.delegate = self;
    _tabView.dataSource = self;
    [self.view addSubview:_tabView];
}

//处理数据
- (void)dealData {
    //基础动画
    NSArray *baseAniData = @[@"位移",@"透明度",@"缩放",@"旋转",@"背景色"];
    NSDictionary *baseAniDic = @{@"title": @"基础动画", @"value": baseAniData};
    
    //关键帧动画
    NSArray *keyFrameAniData = @[@"关键帧",@"路径",@"抖动"];
    NSDictionary *keyFrameAniDic = @{@"title": @"关键帧动画", @"value": keyFrameAniData};
    
    //组动画
    NSArray *groupAniData = @[@"同时执行几组动画",@"连续"];
    NSDictionary *groupAniDic = @{@"title": @"组动画", @"value": groupAniData};
    
    //过渡动画
    NSArray *transitionAniData = @[@"详情演示"];
    NSDictionary *transitionAniDic = @{@"title": @"过渡动画", @"value": transitionAniData};
    
    //组合案例
    NSArray *combinedCasesAniData = @[@"位移",@"透明度",@"缩放",@"旋转",@"背景色"];
    NSDictionary *combinedCasesAniDic = @{@"title": @"组合案例", @"value": combinedCasesAniData};
    
    _dataArray = @[baseAniDic, keyFrameAniDic, groupAniDic, transitionAniDic, combinedCasesAniDic];
    [_tabView reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSDictionary *dic = _dataArray[section];
    NSArray *array = dic[@"value"];
    return array.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSDictionary *dic = _dataArray[section];
    return dic[@"title"];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (nil == cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    cell.textLabel.text = _dataArray[indexPath.section][@"value"][indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0.1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0){
        BaseAnimationVC *vc = [[BaseAnimationVC alloc] initWithType:indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 1){
        KeyFrameAnimationVC *vc = [[KeyFrameAnimationVC alloc] initWithType:indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 2){
        GroupAnimationVC *vc = [[GroupAnimationVC alloc] initWithType:indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 3){
        TransitionAnimationVC *vc = [[TransitionAnimationVC alloc] initWithType:indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 4){
        CombinedCasesAnimationVC *vc = [[CombinedCasesAnimationVC alloc] initWithType:indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end
