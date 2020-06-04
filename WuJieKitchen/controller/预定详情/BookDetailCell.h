//
//  BookDetailCell.h
//  WuJieKitchen
//
//  Created by 天津沃天科技 on 2019/5/31.
//  Copyright © 2019年 wotianshiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BookDetailCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIButton *taskBtn;
@property (strong, nonatomic) IBOutlet UILabel *stateLab;
@property (strong, nonatomic) IBOutlet UILabel *personNumLab1;
@property (strong, nonatomic) IBOutlet UILabel *personNumLab2;
@property (strong, nonatomic) IBOutlet UIButton *detailBtn;

@end

NS_ASSUME_NONNULL_END
