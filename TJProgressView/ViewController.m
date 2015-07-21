//
//  ViewController.m
//  TJProgressView
//
//  Created by MJ on 15/7/20.
//  Copyright (c) 2015年 TJ. All rights reserved.
//

#import "ViewController.h"
#import "TJProgressView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet TJProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _progressView.progress = 0.67;
    _progressView.progressColor = [UIColor colorWithRed:0.590 green:0.208 blue:0.041 alpha:1.000];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClick:(UIButton *)sender {
    _progressView.progress =0.67;
}

@end
