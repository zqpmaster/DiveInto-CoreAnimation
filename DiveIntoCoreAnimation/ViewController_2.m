//
//  ViewController_2.m
//  DiveIntoCoreAnimation
//
//  Created by ZQP on 15/8/8.
//  Copyright (c) 2015年 ZQP. All rights reserved.
//

#import "ViewController_2.h"

@interface ViewController_2 ()

@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController_2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(50, 50, 100, 100);
    layer.backgroundColor = [UIColor blueColor].CGColor;
    layer.delegate = self;
    [self.layerView.layer addSublayer:layer];
    [layer display];
    
    
    
    
    
//    content contenGravity contentScale
    self.layerView.layer.contents = (__bridge id)([UIImage imageNamed:@"wwdc.png"].CGImage);
    self.layerView.layer.contentsGravity = kCAGravityCenter;//此属性被设置后很多属性都不管用了 默认应该为Resize
    self.layerView.layer.contentsScale = [UIScreen mainScreen].scale;
//    self.layerView.layer.masksToBounds = YES;
    
//    self.layerView.layer.contentsRect = CGRectMake(0, 0, 0.5, 0.5); // 可以用它来拼接图片，也就是把多张图片合成一张图片，Cocos2d-x里用的技术。
    
    self.layerView.layer.contentsCenter = CGRectMake(0, 0, 0.5, 0.5);//设置视图中心，用于图层大小变的时候，图片会从中心部分放大
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)button1Act:(id)sender
{
    self.layerView.frame = CGRectInset(self.layerView.frame, -10, 0);
}
- (IBAction)button2Act:(id)sender
{
    self.layerView.frame = CGRectInset(self.layerView.frame, 0, -10);

}

//我们在blueLayer上显式地调用了-display。不同于UIView，当图层显示在屏幕上时，CALayer不会自动重绘它的内容。它把重绘的决定权交给了开发者。
//尽管我们没有用masksToBounds属性，绘制的那个圆仍然沿边界被裁剪了。这是因为当你使用CALayerDelegate绘制寄宿图的时候，并没有对超出边界外的内容提供绘制支持。
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    //draw a thick red circle
    CGContextSetLineWidth(ctx, 10.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}


@end
