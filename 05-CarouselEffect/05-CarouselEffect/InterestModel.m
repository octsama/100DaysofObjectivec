//
//  InterestModel.m
//  05-CarouselEffect
//
//  Created by 君の神様 on 16/4/19.
//  Copyright © 2016年 Rex. All rights reserved.
//

#import "InterestModel.h"

@implementation InterestModel

- (instancetype)initWithTitle:(NSString *)title Description:(NSString *)description ImageUrl:(NSString *)image {
    if ([super init]) {
        _title = title;
        _interestDescription = description;
        _image = image;
    }
    return self;
}

+ (NSArray *)interestArray {
    InterestModel *model1 = [[InterestModel alloc] initWithTitle:@"Hello there, i miss u." Description:@"We love backpack and adventures! We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨" ImageUrl:@"hello"];
    InterestModel *model2 = [[InterestModel alloc] initWithTitle:@"🐳🐳🐳🐳🐳" Description:@"We love romantic stories. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨" ImageUrl:@"dudu"];
    InterestModel *model3 = [[InterestModel alloc] initWithTitle:@"Training like this, #bodyline" Description:@"Create beautiful apps. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨" ImageUrl:@"bodyline"];
    InterestModel *model4 = [[InterestModel alloc] initWithTitle:@"I'm hungry, indeed." Description:@"Cars and aircrafts and boats and sky. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨" ImageUrl:@"wave"];
     InterestModel *model5 = [[InterestModel alloc] initWithTitle:@"Dark Varder, #emoji" Description:@"Meet life with full presence. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨" ImageUrl:@"darkvarder"];
     InterestModel *model6 = [[InterestModel alloc] initWithTitle:@"I have no idea, bitch" Description:@"Get up to date with breaking-news. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨" ImageUrl:@"hhhhh"];
    return @[model1,model2,model3,model4,model5,model6];
}
@end
