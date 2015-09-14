//
//  ViewController.m
//  testDynamic
//
//  Created by zhangqp on 15/9/14.
//
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *greyView;
@property (weak, nonatomic) IBOutlet UIView *blueView;

@property (strong, nonatomic)  UIDynamicAnimator *animator;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    UICollisionBehavior *colliBehavior = [[UICollisionBehavior alloc] initWithItems:@[_blueView, _greyView]];
    
    colliBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    UIGravityBehavior *gravityBehavior= [[UIGravityBehavior alloc] initWithItems:@[_blueView, _greyView]];
//    
    [_animator addBehavior:colliBehavior];
    [_animator addBehavior:gravityBehavior];
    
    
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_animator removeAllBehaviors];
    
    [super touchesBegan:touches withEvent:event];
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:_greyView snapToPoint:point];
    snap.damping = 0.1;
    
    [_animator addBehavior:snap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
