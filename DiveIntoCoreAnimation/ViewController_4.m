//
//  ViewController_4.m
//  DiveIntoCoreAnimation
//
//  Created by ZQP on 15/8/8.
//  Copyright (c) 2015年 ZQP. All rights reserved.
//

#import "ViewController_4.h"
#import <CoreGraphics/CoreGraphics.h>

@interface ViewController_4 ()
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (weak, nonatomic) IBOutlet UIView *greenView;
@property (weak, nonatomic) IBOutlet UIView *greenBackView;//图像裁剪

@end

@implementation ViewController_4

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    self.greenView.layer.cornerRadius = 20;

    self.greenBackView.layer.cornerRadius = 20;//阴影裁剪
    self.greenBackView.layer.shadowOpacity = 0.5;
    self.greenBackView.layer.shadowRadius = 10;
    self.greenBackView.layer.shadowOffset = CGSizeMake(10, 10);
    self.greenView.layer.masksToBounds = YES;

//    [self layermask];
//    [self stretchFilter];
//    [self groupAlpha];
    [self toushitouying];
    
    

}

- (void)toushitouying//透视投影
{
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1.0 / 500;
    transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
    self.layerView.layer.transform = transform;
}

- (void)groupAlpha// 组透明
{
//    UIView有一个叫做alpha的属性来确定视图的透明度。CALayer有一个等同的属性叫做opacity，这两个属性都是影响子层级的。也就是说，如果你给一个图层设置了opacity属性，那它的子图层都会受此影响。
    
//    理想状况下，当你设置了一个图层的透明度，你希望它包含的整个图层树像一个整体一样的透明效果。你可以通过设置Info.plist文件中的UIViewGroupOpacity为YES来达到这个效果，但是这个设置会影响到这个应用，整个app可能会受到不良影响。如果UIViewGroupOpacity并未设置，iOS 6和以前的版本会默认为NO（也许以后的版本会有一些改变）。
//    
//    另一个方法就是，你可以设置CALayer的一个叫做shouldRasterize属性（见清单4.7）来实现组透明的效果，如果它被设置为YES，在应用透明度之前，图层及其子图层都会被整合成一个整体的图片，这样就没有透明度混合的问题了（如图4.21）。
//    
//    为了启用shouldRasterize属性，我们设置了图层的rasterizationScale属性。默认情况下，所有图层拉伸都是1.0， 所以如果你使用了shouldRasterize属性，你就要确保你设置了rasterizationScale属性去匹配屏幕，以防止出现Retina屏幕像素化的问题。
//    
//    当shouldRasterize和UIViewGroupOpacity一起的时候，性能问题就出现了（我们在第12章『速度』和第15章『图层性能』将做出介绍），但是性能碰撞都本地化了（译者注：这句话需要再翻译）。
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 50, 50)];
    label.backgroundColor = self.layerView.backgroundColor;
    label.text = @"Label";
    [self.layerView addSubview:label];
    
    self.layerView.alpha = 0.5;
//    self.layerView.layer.shouldRasterize = YES;
//    self.layerView.layer.rasterizationScale = [[UIScreen mainScreen] scale];

}

-(void)stretchFilter//拉伸过滤
{
    self.layerView.layer.backgroundColor = [UIColor clearColor].CGColor;//shadowPath属性
    self.layerView.layer.contents = (__bridge id)([UIImage imageNamed:@"arrow.png"].CGImage);
    self.layerView.layer.contentsScale = 5;//这个属性必须配合重心属性，不然不起作用
    self.layerView.layer.contentsGravity = kCAGravityCenter;
    self.layerView.layer.minificationFilter = kCAFilterNearest;

}

-(void)shadowpath
{
    self.layerView.layer.backgroundColor = [UIColor clearColor].CGColor;//shadowPath属性
    self.layerView.layer.shadowOpacity = 0.5;
    self.layerView.layer.contents = (__bridge id)([UIImage imageNamed:@"arrow.png"].CGImage);
    CGMutablePathRef path = CGPathCreateMutable();
    //    CGPathAddRect(path, NULL, CGRectMake(0, 0, 200, 200));
    CGPathAddEllipseInRect(path, NULL, CGRectMake(0, 0, 200, 200));
    self.layerView.layer.shadowPath = path;
    CGPathRelease(path);

}


-(void)layermask//图层蒙板
{
//    mask图层定义了父图层的部分可见区域。
//    
//    mask图层的Color属性是无关紧要的，真正重要的是图层的轮廓。mask属性就像是一个饼干切割机，mask图层实心的部分会被保留下来，其他的则会被抛弃。（如图4.12）
    CALayer *mask = [CALayer layer];
    mask.frame = CGRectMake(0, 0, 200, 200);
    mask.contents = (__bridge id)([UIImage imageNamed:@"arrow.png"].CGImage);
    self.layerView.layer.mask = mask;


}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}


@end
