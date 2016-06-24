//
//  ViewController.m
//  粒子效果
//
//  Created by maker on 16/6/22.
//  Copyright © 2016年 maker. All rights reserved.
//

#import "ViewController.h"
#import "vcView.h"
@interface ViewController ()
@property(nonnull,strong)vcView *myView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myView = (vcView *) self.view;
}
- (IBAction)start:(id)sender {
    [self.myView start];
}
- (IBAction)reSet:(id)sender {
    [self.myView reSet];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
