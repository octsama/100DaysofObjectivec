//
//  ViewController.m
//  01-SimpleStopWatch
//
//  Created by 君の神様 on 16/3/8.
//  Copyright © 2016年 Rex. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;
@property (assign, nonatomic) float counter;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation ViewController

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.counter = 0.0;
    self.timeLabel.text = [NSString stringWithFormat:@"%.1f",self.counter];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)resetButtonClick:(UIButton *)sender {
    [self.timer invalidate];
    self.counter = 0.0;
    self.timeLabel.text = [NSString stringWithFormat:@"%.1f",self.counter];
    self.playButton.enabled = YES;
    self.stopButton.enabled = YES;
}
- (IBAction)playButtonClick:(UIButton *)sender {
    self.playButton.enabled = NO;
    self.stopButton.enabled = YES;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timeUpdata) userInfo:nil repeats:YES];
}
- (IBAction)stopButtonClick:(UIButton *)sender {
    self.playButton.enabled = YES;
    self.stopButton.enabled = NO;
    [self.timer invalidate];
}

- (void)timeUpdata {
    self.counter += 0.1;
    self.timeLabel.text = [NSString stringWithFormat:@"%.1f",self.counter];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
