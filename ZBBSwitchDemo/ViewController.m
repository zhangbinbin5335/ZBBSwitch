//
//  ViewController.m
//  ZBBSwitchDemo
//
//  Created by zhangbinbin on 16/2/24.
//  Copyright © 2016年 zhangbinbin. All rights reserved.
//

#import "ViewController.h"
#import "ZBBSwitch.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZBBSwitch* mySwitch = [[ZBBSwitch alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
    mySwitch.leftName = @"开";
    mySwitch.rightName = @"关";
    [mySwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:mySwitch];
}

-(void)switchChanged:(ZBBSwitch*)sender
{
    NSLog(@"isOn = %d",sender.isOn);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
