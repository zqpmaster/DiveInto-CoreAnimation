//
//  ViewController_3.m
//  DiveIntoCoreAnimation
//
//  Created by ZQP on 15/8/8.
//  Copyright (c) 2015年 ZQP. All rights reserved.
//

#import "ViewController_3.h"

@interface ViewController_3 ()
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (weak, nonatomic) IBOutlet UIView *greenView;
@property (strong, nonatomic)  NSTimer *timer;

@end

@implementation ViewController_3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.greenView.layer.zPosition += 1;//Z坐标轴

    
    self.layerView.backgroundColor = [UIColor clearColor];
    self.layerView.layer.contents = (__bridge id)([UIImage imageNamed:@"arrow.png"].CGImage);
    self.layerView.layer.anchorPoint = CGPointMake(0.5, 0);//锚点
    self.timer = [NSTimer timerWithTimeInterval:0.001 target:self selector:@selector(rotateArrow) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(rotateArrow) userInfo:nil repeats:YES];

    [_timer fire];
    // Do any additional setup after loading the view.
}

-(void)rotateArrow
{
    static float angle = 0;
    angle += 0.002;
    
    self.layerView.transform = CGAffineTransformMakeRotation(angle);
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.timer invalidate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event//hittest containpoint
{
    CGPoint point = [[touches anyObject] locationInView:self.view];
    CALayer *layer = [self.greenView.layer hitTest:point];//hittest接收的CGPoint是方法接收者最近的父视图坐标系内的点
    
    if (layer == self.greenView.layer)
    {
        NSLog(@"YES by hittest");
    }
    
    
    
    point = [self.greenView.layer convertPoint:point fromLayer:self.view.layer];//containpoint接收的点是方法接收者坐标系内的点
    if ([self.greenView.layer containsPoint:point])
    {
        NSLog(@"YES by containpoint");
    }
}


//在Mac OS平台，CALayer有一个叫做layoutManager的属性可以通过CALayoutManager协议和CAConstraintLayoutManager类来实现自动排版的机制。但由于某些原因，这在iOS上并不适用。
//在IOS上只能用下面这个代理方法
- (void)layoutSublayersOfLayer:(CALayer *)layer
{//可以控制CALayer的自动布局
    
}


@end
