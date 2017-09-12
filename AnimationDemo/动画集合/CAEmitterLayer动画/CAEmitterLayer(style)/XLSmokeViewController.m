//
//  XLSmokeViewController.m
//  AnimationDemo
//
//  Created by 王小腊 on 2017/9/12.
//  Copyright © 2017年 王小腊. All rights reserved.
//

#import "XLSmokeViewController.h"
#import <QuartzCore/CoreAnimation.h>

@interface XLSmokeViewController ()

@property (strong)	CAEmitterLayer	*heartsEmitter;

@property (strong, nonatomic) UIButton		*likeButton;
@end

@implementation XLSmokeViewController
@synthesize heartsEmitter,likeButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"烟雾扩散";
    self.view.backgroundColor = [UIColor blackColor];
    
    self.likeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    self.likeButton.backgroundColor = [UIColor blueColor];
    [self.likeButton  setTitle:@"点击" forState:UIControlStateNormal];
    [self.likeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.likeButton addTarget:self action:@selector(likeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.likeButton];
    self.likeButton.center = self.view.center;
    
    
    
    self.heartsEmitter = [CAEmitterLayer layer];
    self.heartsEmitter.emitterPosition = CGPointMake(likeButton.frame.origin.x + likeButton.frame.size.width/2.0,
                                                     likeButton.frame.origin.y + likeButton.frame.size.height/2.0);
    self.heartsEmitter.emitterSize = likeButton.bounds.size;
    
    // Spawn points for the hearts are within the area defined by the button frame
    self.heartsEmitter.emitterMode = kCAEmitterLayerVolume;
    self.heartsEmitter.emitterShape = kCAEmitterLayerRectangle;
    self.heartsEmitter.renderMode = kCAEmitterLayerAdditive;
    
    // Configure the emitter cell
    CAEmitterCell *heart = [CAEmitterCell emitterCell];
    heart.name = @"heart";
    
    heart.emissionLongitude = M_PI/2.0; // up
    heart.emissionRange = 0.55 * M_PI;  // in a wide spread
    heart.birthRate		= 0.0;			// emitter is deactivated for now
    heart.lifetime		= 10.0;			// hearts vanish after 10 seconds
    
    heart.velocity		= -120;			// particles get fired up fast
    heart.velocityRange = 60;			// with some variation
    heart.yAcceleration = 20;			// but fall eventually
    
    heart.contents		= (id) [[UIImage imageNamed:@"DazHeart"] CGImage];
    heart.color			= [[UIColor colorWithRed:0.5 green:0.0 blue:0.5 alpha:0.5] CGColor];
    heart.redRange		= 0.3;			// some variation in the color
    heart.blueRange		= 0.3;
    heart.alphaSpeed	= -0.5 / heart.lifetime;  // fade over the lifetime
    
    heart.scale			= 0.15;			// let them start small
    heart.scaleSpeed	= 0.5;			// but then 'explode' in size
    heart.spinRange		= 2.0 * M_PI;	// and send them spinning from -180 to +180 deg/s
    
    // Add everything to our backing layer
    self.heartsEmitter.emitterCells = [NSArray arrayWithObject:heart];
    [self.view.layer addSublayer:heartsEmitter];

}
- (void)viewWillUnload
{
    [super viewWillUnload];
    [self.heartsEmitter removeFromSuperlayer];
    self.heartsEmitter = nil;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIDeviceOrientationPortrait);
}
#pragma mark -
#pragma mark Interaction
// ---------------------------------------------------------------------------------------------------------------

- (void)likeButtonPressed:(id)sender
{
    // Fires up some hearts to rain on the view
    CABasicAnimation *heartsBurst = [CABasicAnimation animationWithKeyPath:@"emitterCells.heart.birthRate"];
    heartsBurst.fromValue		= [NSNumber numberWithFloat:150.0];
    heartsBurst.toValue			= [NSNumber numberWithFloat:  0.0];
    heartsBurst.duration		= 5.0;
    heartsBurst.timingFunction	= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [self.heartsEmitter addAnimation:heartsBurst forKey:@"heartsBurst"];
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
