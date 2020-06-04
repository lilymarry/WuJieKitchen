//
//  TakeAwayListSublCell.m
//  WuJieKitchen
//
//  Created by 天津沃天科技 on 2019/5/30.
//  Copyright © 2019年 wotianshiyan. All rights reserved.
//

#import "OrderListSubCell.h"

@implementation OrderListSubCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _nameLab.layer.borderWidth=1;
    _nameLab.layer.cornerRadius=5;
    _nameLab.layer.masksToBounds=YES;
    _nameLab.layer.borderColor=color(247, 160, 8).CGColor;
    _nameLab.backgroundColor=color(197, 233, 250);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
