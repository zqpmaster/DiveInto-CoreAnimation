//
//  ViewController_7.m
//  DiveIntoCoreAnimation
//
//  Created by ZQP on 15/9/4.
//  Copyright (c) 2015年 ZQP. All rights reserved.
//

#import "ViewController_7.h"

@interface ViewController_7 ()

@property (nonatomic, strong) CALayer *layer;

@end

@implementation ViewController_7

- (void)viewDidLoad {
    [super viewDidLoad];
    self.layer = [CALayer layer];
    _layer.frame = CGRectMake(100, 100, 100, 100);
    _layer.backgroundColor = [UIColor blackColor].CGColor;
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    transition.duration = 1;

    _layer.actions = @{@"backgroundColor": transition};
    
    [self.view.layer addSublayer:_layer];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)button:(id)sender {
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;

    
    [CATransaction begin];//代码顺序对执行结果有影响
    [CATransaction setAnimationDuration:5];
    static int i = 0;
    i ++;
    [CATransaction setCompletionBlock:^{
        self.layer.transform = CATransform3DMakeRotation(M_PI_4 * i, 0, 0, 1);
    }];

    
    self.layer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;

    [CATransaction commit];
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
