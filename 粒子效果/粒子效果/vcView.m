//
//  vcView.m
//  粒子效果
//
//  Created by maker on 16/6/22.
//  Copyright © 2016年 maker. All rights reserved.
//

#import "vcView.h"
@interface vcView()
@property(nonnull,strong)UIBezierPath *path;//路径
@property (nonatomic,strong)CALayer *dotLayer;//粒子图层

@end

@implementation vcView
- (void)awakeFromNib{
    //添加触摸手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:pan];
    UIBezierPath *path = [UIBezierPath bezierPath];
    self.path = path;
    
    //添加一个图层
    CALayer *dotLayer = [CALayer layer];
    [self.layer addSublayer:dotLayer];
    self.dotLayer = dotLayer;
    dotLayer.backgroundColor = [UIColor redColor].CGColor;
    self.dotLayer.frame = CGRectMake(-100, 0, 10, 10);
    
    CAReplicatorLayer *rel = (CAReplicatorLayer *)self.layer;
    rel.instanceCount = 4;
    rel.instanceDelay = 0.2;
    rel.transform = CATransform3DMakeTranslation(30, 0, 0);
    
    
}
- (void)pan:(UIPanGestureRecognizer *)pan{
    //判断是否开始状态
    CGPoint currentPoint = [pan locationInView:self];
    if (pan.state == UIGestureRecognizerStateBegan) {

        [self.path moveToPoint:currentPoint];
    }
    else if (pan.state == UIGestureRecognizerStateChanged)
    {
        [self.path addLineToPoint:currentPoint];
        
        //重绘
        [self setNeedsDisplay];
    }
}
- (void)drawRect:(CGRect)rect {
    [self.path stroke];
}

- (void)start{
    //添加动画
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    keyAnimation.repeatCount = MAXFLOAT;
    keyAnimation.keyPath = @"position";
    keyAnimation.path = self.path.CGPath;
    keyAnimation.duration = 3;
    [self.dotLayer addAnimation:keyAnimation forKey:nil];
    
}
- (void)reSet{
    [self.path removeAllPoints];
    [self setNeedsDisplay];//重绘
    
    //移除动画
    [self.dotLayer removeAllAnimations];
}
//设置 view 的 layer 为复制图层

+(nonnull Class)layerClass{
    return [CAReplicatorLayer class];
}
@end






