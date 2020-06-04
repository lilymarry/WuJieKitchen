//
//  TakeAwayListCell.h
//  WuJieKitchen
//
//  Created by 天津沃天科技 on 2019/5/30.
//  Copyright © 2019年 wotianshiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OrderListCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIButton *detailBtn;
@property (strong, nonatomic) IBOutlet UIView *yanhuiView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *yanhuiHHH;
@property (strong, nonatomic) IBOutlet UILabel *stateLab;
-(void)refreshCell:(NSString *)index type:(NSString *)type;
@end

NS_ASSUME_NONNULL_END
