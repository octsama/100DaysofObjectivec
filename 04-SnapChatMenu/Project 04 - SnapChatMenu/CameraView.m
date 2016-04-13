//
//  CameraView.m
//  Project 04 - SnapChatMenu
//
//  Created by 君の神様 on 16/4/12.
//  Copyright © 2016年 Rex. All rights reserved.
//

#import "CameraView.h"
#import <AVFoundation/AVFoundation.h>

@interface CameraView () <UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIView *cameraView;
@property (weak, nonatomic) IBOutlet UIImageView *tempImageView;
@property (strong, nonatomic) AVCaptureSession *captureSession;
@property (strong, nonatomic) AVCaptureStillImageOutput *stillImageOutput;
@property (strong, nonatomic) AVCaptureVideoPreviewLayer *previewLayer;
@property (assign, nonatomic) BOOL didTakePhoto;

@end

@implementation CameraView

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarHidden = YES;
    self.captureSession = [[AVCaptureSession alloc] init];
    self.captureSession.sessionPreset = AVCaptureSessionPreset1920x1080;
    AVCaptureDevice *backCamera = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error;
    AVCaptureInput *input = [[AVCaptureDeviceInput alloc] initWithDevice:backCamera error:&error];
    if (error == nil && [self.captureSession canAddInput:input]) {
        [self.captureSession addInput:input];
        self.stillImageOutput = [[AVCaptureStillImageOutput alloc] init];
        self.stillImageOutput.outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys:AVVideoCodecJPEG,AVVideoCodecKey, nil];
        if ([self.captureSession canAddOutput:self.stillImageOutput]) {
            [self.captureSession addOutput:self.stillImageOutput];
            self.previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.captureSession];
            self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspect;
            self.previewLayer.connection.videoOrientation = AVCaptureVideoOrientationPortrait;
            [self.cameraView.layer addSublayer:self.previewLayer];
            [self.captureSession startRunning];
        }
    }
}

- (void)didPressTakePhoto {
    AVCaptureConnection *videoConnection = [self.stillImageOutput connectionWithMediaType:AVMediaTypeVideo];
    if (videoConnection) {
        videoConnection.videoOrientation = AVCaptureVideoOrientationPortrait;
        [self.stillImageOutput captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
            if (imageDataSampleBuffer != nil) {
                NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
                UIImage *image = [UIImage imageWithData:imageData];
                self.tempImageView.image = image;
                self.tempImageView.hidden = NO;
            }
        }];
    }
}

- (void)didPressTakeAnother {
    if (self.didTakePhoto) {
        self.tempImageView.hidden = YES;
        self.didTakePhoto = NO;
    } else {
        [self.captureSession startRunning];
        self.didTakePhoto = YES;
        [self didPressTakePhoto];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self didPressTakeAnother];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.previewLayer.frame = self.cameraView.bounds;
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
