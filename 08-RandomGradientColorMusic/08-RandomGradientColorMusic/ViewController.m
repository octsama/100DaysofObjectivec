//
//  ViewController.m
//  08-RandomGradientColorMusic
//
//  Created by 君の神様 on 16/4/24.
//  Copyright © 2016年 Rex. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) CAGradientLayer *gradientLayer;

@end

@implementation ViewController

- (CAGradientLayer *)gradientLayer {
    if (!_gradientLayer) {
        _gradientLayer = [[CAGradientLayer alloc] init];
    }
    return _gradientLayer;
}

- (IBAction)musicPlayButtonClicked:(UIButton *)sender {
    NSURL *bgMusic = [NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"Ecstasy" ofType:@"mp3"]];
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:bgMusic error:nil];
    [self.audioPlayer prepareToPlay];
    [self.audioPlayer play];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(randomColor) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    [timer fire];
    CGFloat redValue = drand48();
    CGFloat blueValue = drand48();
    CGFloat greenValue = drand48();
    self.view.backgroundColor = [UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1.0];
    self.gradientLayer.frame = self.view.bounds;
    UIColor *color1 = [UIColor colorWithWhite:0.5 alpha:0.2];
    UIColor *color2 = [UIColor colorWithRed:1.0 green:0 blue:0 alpha:0.4];
    UIColor *color3 = [UIColor colorWithRed:0 green:1.0 blue:0 alpha:0.3];
    UIColor *color4 = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.3];
    UIColor *color5 = [UIColor colorWithWhite:0.4 alpha:0.2];
    self.gradientLayer.colors = @[color1,color2,color3,color4,color5];
    self.gradientLayer.locations = @[@0.10, @0.30, @0.50, @0.70, @0.90];
    self.gradientLayer.startPoint = CGPointMake(0, 0);
    self.gradientLayer.endPoint = CGPointMake(1, 1);
    [self.view.layer addSublayer:self.gradientLayer];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [UIApplication sharedApplication].statusBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)randomColor {
    CGFloat redValue = drand48();
    CGFloat blueValue = drand48();
    CGFloat greenValue = drand48();
    self.view.backgroundColor = [UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1.0];
}



@end
