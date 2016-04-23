//
//  ViewController.m
//  07-PullToRefresh
//
//  Created by 君の神様 on 16/4/23.
//  Copyright © 2016年 Rex. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UIRefreshControl *refersh;
@property (strong, nonatomic) UITableViewController *emojiTableViewController;
@property (strong, nonatomic) NSArray *emojiData;
@property (strong, nonatomic) NSArray *favoriteEmoji;
@property (strong, nonatomic) UINavigationBar *nav;

@end

static NSString *cellIdentifer = @"NewCellIdentifier";

@implementation ViewController

- (NSArray *)emojiData {
    if (!_emojiData) {
        _emojiData = @[@"🤗🤗🤗🤗🤗",
                      @"😅😅😅😅😅",
                      @"😆😆😆😆😆"];
    }
    return _emojiData;
}

- (UIRefreshControl *)refersh {
    if (!_refersh) {
        _refersh = [[UIRefreshControl alloc] init];
    }
    return _refersh;
}

- (UITableViewController *)emojiTableViewController {
    if (!_emojiTableViewController) {
        _emojiTableViewController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    }
    return _emojiTableViewController;
}

- (UINavigationBar *)nav {
    if (!_nav) {
        _nav = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
    }
    return _nav;
}

- (NSArray *)favoriteEmoji {
    if (!_favoriteEmoji) {
        _favoriteEmoji = @[@"🏃🏃🏃🏃🏃", @"💩💩💩💩💩", @"👸👸👸👸👸", @"🤗🤗🤗🤗🤗", @"😅😅😅😅😅", @"😆😆😆😆😆" ];

    }
    return _favoriteEmoji;
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *emojiTableView = self.emojiTableViewController.tableView;
    emojiTableView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height - 64);
    emojiTableView.backgroundColor = [UIColor colorWithRed:0.092 green:0.096 blue:0.116 alpha:1];
    emojiTableView.dataSource = self;
    [emojiTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifer];
    self.refersh.backgroundColor = [UIColor colorWithRed:0.113 green:0.113 blue:0.145 alpha:1];
    self.emojiTableViewController.refreshControl = self.refersh;
    [self.refersh addTarget:self action:@selector(didRoadEmoji) forControlEvents:UIControlEventValueChanged];
    NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc] initWithString:@"Refreshing" attributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.refersh.attributedTitle = attriString;
    self.refersh.tintColor = [UIColor whiteColor];
    self.title = @"emoji";
    self.nav.barStyle = UIBarStyleBlackTranslucent;
    emojiTableView.rowHeight = UITableViewAutomaticDimension;
    emojiTableView.estimatedRowHeight = 60.0;
    emojiTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    emojiTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:emojiTableView];
    [self.view addSubview:self.nav];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.emojiData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer forIndexPath:indexPath];
    cell.textLabel.text = self.emojiData[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = [UIFont systemFontOfSize:50];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)didRoadEmoji {
    self.emojiData = self.favoriteEmoji;
    [self.emojiTableViewController.tableView reloadData];
    [self.refersh endRefreshing];
}


#pragma mark - UITableViewDelegate

@end
