//
//  ViewController.m
//  05-CarouselEffect
//
//  Created by 君の神様 on 16/4/14.
//  Copyright © 2016年 Rex. All rights reserved.
//

#import "ViewController.h"
#import "InterestCollectionViewCell.h"
#import "InterestModel.h"

@interface ViewController () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *interestArray;

@end

@implementation ViewController

- (NSArray *)interestArray {
    if (!_interestArray) {
        _interestArray = [InterestModel interestArray];
    }
    return _interestArray;
}

- (void)viewDidLoad {
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


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.interestArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    InterestCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"InterestCell" forIndexPath:indexPath];
    cell.interest = self.interestArray[indexPath.row];
    return cell;
}

@end
