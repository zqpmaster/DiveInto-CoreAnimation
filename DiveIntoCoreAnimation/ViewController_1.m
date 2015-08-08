//
//  ViewController_1
//  DiveIntoCoreAnimation
//
//  Created by ZQP on 15/8/4.
//  Copyright (c) 2015年 ZQP. All rights reserved.
//

#import "ViewController_1.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController_1 ()
@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation ViewController_1

- (void)viewDidLoad {
    [super viewDidLoad];
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(50, 50, 100, 100);
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.delegate = self;
    [self.layerView.layer addSublayer:layer];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
