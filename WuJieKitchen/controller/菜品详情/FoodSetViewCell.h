//
//  FoodSetViewCell.h
//  WuJieKitchen
//
//  Created by 天津沃天科技 on 2019/5/30.
//  Copyright © 2019年 wotianshiyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopButton.h"
NS_ASSUME_NONNULL_BEGIN

@interface FoodSetViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet PopButton *but1;
@property (strong, nonatomic) IBOutlet PopButton *but2;

@property (strong, nonatomic) IBOutlet UILabel *lab1;
@property (strong, nonatomic) IBOutlet UILabel *lab2;

@property (strong, nonatomic) IBOutlet UIImageView *imageView1;
@property (strong, nonatomic) IBOutlet UIImageView *imageView2;


@property (strong, nonatomic) IBOutlet UILabel *nameLab;



@end

NS_ASSUME_NONNULL_END
