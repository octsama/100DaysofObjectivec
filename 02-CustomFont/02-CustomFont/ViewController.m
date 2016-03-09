//
//  ViewController.m
//  02-CustomFont
//
//  Created by 君の神様 on 16/3/9.
//  Copyright © 2016年 Rex. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *fontTableView;
@property (weak, nonatomic) IBOutlet UIButton *changeButton;
@property (strong, nonatomic) NSArray *data;
@property (strong, nonatomic) NSArray *fontNames;
@property (assign,nonatomic) NSInteger fontIndex;

@end

@implementation ViewController

- (NSArray *)data {
    if (!_data) {
        _data = @[@"30 Days Objective-C", @"这些字体特别适合打「奋斗」和「理想」", @"谢谢「造字工房」，本案例不涉及商业使用", @"使用到造字工房劲黑体，致黑体，童心体", @"呵呵，再见🤗 See you next Project"];
    }
    return _data;
}

- (NSArray *)fontNames {
    if (!_fontNames) {
        _fontNames = @[@"MFTongXin_Noncommercial-Regular", @"MFJinHei_Noncommercial-Regular", @"MFZhiHei_Noncommercial-Regular"];
    }
    return _fontNames;
}

- (NSInteger)fontIndex {
    if (!_fontIndex) {
        _fontIndex = 0;
    }
    return _fontIndex;
}

- (void)viewDidLoad {
    self.fontTableView.delegate = self;
    self.fontTableView.dataSource = self;
    for (NSString *family in [UIFont familyNames]) {
        for (NSString *font in [UIFont fontNamesForFamilyName:family]) {
            NSLog(@"%@",font);
        }
    }
    self.changeButton.layer.cornerRadius = 50;
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (IBAction)changButtonClick:(UIButton *)sender {
    self.fontIndex = (self.fontIndex + 1) % 3;
    [self.fontTableView reloadData];
}

#pragma mark - UITableViewDataSource 

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.fontTableView dequeueReusableCellWithIdentifier:@"FontCell" forIndexPath:indexPath];
    cell.textLabel.text = self.data[indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont fontWithName:self.fontNames[self.fontIndex] size:16];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}


#pragma mark - UITableViewDelagate

@end
