//
//  ViewController.m
//  03-PlayLocalVideo
//
//  Created by 君の神様 on 16/3/11.
//  Copyright © 2016年 Rex. All rights reserved.
//

#import "ViewController.h"
#import "VideoCell.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *data;

@end

@implementation ViewController

- (NSArray *)data {
    if (!_data) {
        _data = @[ @{ @"image" : @"videoScreenshot01",
                      @"title" : @"Introduce 3DS Mario",
                      @"source" : @"Youtube - 06:32" },
                   @{ @"image" : @"videoScreenshot02",
                      @"title" : @"Emoji Among Us",
                      @"source" : @"Vimeo - 3:34" },
                   @{ @"image" : @"videoScreenshot03",
                      @"title" : @"Seals Documentary",
                      @"source" : @"Vine - 00:06" },
                   @{ @"image" : @"videoScreenshot04",
                      @"title" : @"Adventure Time",
                      @"source" : @"Youtube - 02:39" },
                   @{ @"image" : @"videoScreenshot05",
                      @"title" : @"Facebook HQ",
                      @"source" : @"Facebook - 10:20" },
                   @{ @"image" : @"videoScreenshot06",
                      @"title" : @"Lijiang Lugu Lake",
                      @"source" : @"Allen - 20:30" } ];
    }
    return _data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)playButtonClicked:(UIButton *)sender {
    AVPlayerViewController *playViewController = [[AVPlayerViewController alloc] init];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"emoji zone" ofType:@"mp4"];
    AVPlayer *playerView = [[AVPlayer alloc] initWithURL:[NSURL fileURLWithPath:path]];
    playViewController.player = playerView;
    [self presentViewController:playViewController animated:YES completion:^{
        [playViewController.player play];
    }];
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 220;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VideoCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"VideoCell" forIndexPath:indexPath];
    cell.screenShot.image = [UIImage imageNamed:self.data[indexPath.row][@"image"]];
    cell.titleLabel.text = self.data[indexPath.row][@"title"];
    cell.sourceLabel.text = self.data[indexPath.row][@"source"];
    return cell;
}

@end
