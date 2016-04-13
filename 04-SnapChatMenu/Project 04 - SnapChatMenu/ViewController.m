//
//  ViewController.m
//  Project 04 - SnapChatMenu
//
//  Created by 君の神様 on 16/4/12.
//  Copyright © 2016年 Rex. All rights reserved.
//

#import "ViewController.h"
#import "LeftView.h"
#import "RightView.h"
#import "CameraView.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    LeftView *leftView = [[LeftView alloc] init];
    CameraView *cameraView = [[CameraView alloc] init];
    RightView *rightView = [[RightView alloc] init];
    [self addChildViewController:rightView];
    [self.scrollView addSubview:rightView.view];
    [rightView didMoveToParentViewController:self];
    [self addChildViewController:leftView];
    [self.scrollView addSubview:leftView.view];
    [leftView didMoveToParentViewController:self];
    [self addChildViewController:cameraView];
    [self.scrollView addSubview:cameraView.view];
    [cameraView didMoveToParentViewController:self];
    CGRect centerViewFrame = cameraView.view.frame;
    centerViewFrame.origin.x = self.view.frame.size.width;
    cameraView.view.frame = centerViewFrame;
    CGRect rightViewFrame = rightView.view.frame;
    rightViewFrame.origin.x = 2 * self.view.frame.size.width;
    rightView.view.frame = rightViewFrame;
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 3, self.view.frame.size.height);
}

/*
 var centerViewFrame: CGRect = centerView.view.frame
 centerViewFrame.origin.x = self.view.frame.width
 centerView.view.frame = centerViewFrame
 
 var rightViewFrame: CGRect = rightView.view.frame
 rightViewFrame.origin.x = 2 * self.view.frame.width
 rightView.view.frame = rightViewFrame
 
 
 self.scrollView.contentSize = CGSizeMake(self.view.frame.width * 3, self.view.frame.size.height)
 

 */


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
