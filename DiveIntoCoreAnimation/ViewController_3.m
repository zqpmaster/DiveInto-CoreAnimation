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
@property (strong, nonatomic)  NSTimer *timer;

@end

@implementation ViewController_3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.layerView.backgroundColor = [UIColor clearColor];
    self.layerView.layer.contents = (__bridge id)([UIImage imageNamed:@"arrow.png"].CGImage);
    self.layerView.layer.anchorPoint = CGPointMake(0.5, 0);
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
