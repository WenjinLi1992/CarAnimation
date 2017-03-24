//
//  ViewController.m
//  CarAnimationTwo
//
//  Created by lwj on 17/3/1.
//  Copyright © 2017年 WenJin Li. All rights reserved.
//

#import "ViewController.h"
#import "CarImageView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *fileStr = [[NSBundle mainBundle]pathForResource:@"CarAnimation" ofType:@"json"];
    CarImageView* imageView = [[CarImageView alloc]initWithFrame:[[UIScreen mainScreen] bounds]withConfigFilePath:fileStr];
    [self.view addSubview:imageView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
