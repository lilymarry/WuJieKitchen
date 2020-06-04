//
//  MainSubCell.h
//  WuJieKitchen
//
//  Created by 天津沃天科技 on 2019/5/29.
//  Copyright © 2019年 wotianshiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainSubCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *nameLab;
@property (strong, nonatomic) IBOutlet UILabel *stateLab;
@property (strong, nonatomic) IBOutlet UILabel *timeLab;
@property (strong, nonatomic) IBOutlet UIButton *alertBtn;

@property (strong, nonatomic) IBOutlet UIButton *newsBtn;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *newsBtnWW;


@end

NS_ASSUME_NONNULL_END
