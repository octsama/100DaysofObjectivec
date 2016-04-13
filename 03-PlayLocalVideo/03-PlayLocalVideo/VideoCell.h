//
//  VideoCell.h
//  03-PlayLocalVideo
//
//  Created by 君の神様 on 16/3/11.
//  Copyright © 2016年 Rex. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface VideoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *screenShot;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;

@end
