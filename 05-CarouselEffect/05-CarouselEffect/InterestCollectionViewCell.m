//
//  InterestCollectionViewCell.m
//  05-CarouselEffect
//
//  Created by 君の神様 on 16/4/19.
//  Copyright © 2016年 Rex. All rights reserved.
//

#import "InterestCollectionViewCell.h"
#import "InterestModel.h"

@interface InterestCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *featuredImage;
@property (weak, nonatomic) IBOutlet UILabel *interestLabel;

@end

@implementation InterestCollectionViewCell

- (void)setInterest:(InterestModel *)interest {
    self.featuredImage.image = [UIImage imageNamed:interest.image];
    self.interestLabel.text = interest.title;
}

@end
