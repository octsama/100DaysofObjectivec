//
//  InterestModel.h
//  05-CarouselEffect
//
//  Created by 君の神様 on 16/4/19.
//  Copyright © 2016年 Rex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InterestModel : NSObject

@property(nonatomic, strong)NSString *title;
@property(nonatomic, strong)NSString *interestDescription;
@property(nonatomic, strong)NSString *image;

- (instancetype)initWithTitle:(NSString *)title Description:(NSString *)description ImageUrl:(NSString *)image;
+ (NSArray *)interestArray;

@end
