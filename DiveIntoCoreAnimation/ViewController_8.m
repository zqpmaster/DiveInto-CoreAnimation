//
//  ViewController_8.m
//  DiveIntoCoreAnimation
//
//  Created by ZQP on 15/9/12.
//  Copyright (c) 2015年 ZQP. All rights reserved.
//

#import "ViewController_8.h"

@interface ViewController_8 ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController_8
{
    CALayer *shipLayer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self performSelector:@selector(keyframeAnimation) withObject:nil afterDelay:2];
    [self performSelector:@selector(removeAnimation) withObject:nil afterDelay:4];

    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)keyframeAnimation
{
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(50, 150)];
    [path addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(100, 0) controlPoint2:CGPointMake(225, 300)];
    
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = path.CGPath;
    pathLayer.strokeColor = [UIColor blackColor].CGColor;
    pathLayer.fillColor = [UIColor clearColor].CGColor;

    pathLayer.lineWidth = 1.0;
    [self.view.layer addSublayer:pathLayer];

    shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 150, 50, 20);
    shipLayer.backgroundColor = [UIColor greenColor].CGColor;
    [self.view.layer addSublayer:shipLayer];
    
    CAKeyframeAnimation *keyFrAni = [CAKeyframeAnimation animation];
    keyFrAni.keyPath = @"position";
    keyFrAni.path = path.CGPath;
    keyFrAni.rotationMode = kCAAnimationRotateAuto;
    
    CABasicAnimation *basicAni = [CABasicAnimation animation];
    basicAni.keyPath = @"backgroundColor";
    basicAni.toValue = (__bridge id)([UIColor redColor].CGColor);
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[keyFrAni, basicAni];
    group.duration = 4;
    
    [shipLayer addAnimation:group forKey:@"group"];

}

- (void)removeAnimation
{
    [shipLayer removeAllAnimations];
}

- (void)transitionAni
{
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
    transition.duration = 4;//不用设置keypath，因为都是transition
    
    [self.imageView.layer addAnimation:transition forKey:nil];
    self.imageView.image = [UIImage imageNamed:@"wwdc.png"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
