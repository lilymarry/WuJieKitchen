//
//  FoodDetailTopView.h
//  WuJieKitchen
//
//  Created by 天津沃天科技 on 2019/5/29.
//  Copyright © 2019年 wotianshiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FoodDetailTopView : UIView
@property (strong, nonatomic) IBOutlet UIView *thisView;
@property (strong, nonatomic) IBOutlet UIButton *setBtn;
@property (strong, nonatomic) IBOutlet UIButton *cookBtn;
@property (strong, nonatomic) IBOutlet UIView *cookView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *cookViewHH;

@property (strong, nonatomic) IBOutlet UILabel *stateLab;
@property (strong, nonatomic) IBOutlet UIButton *inforBtn;
@property (strong, nonatomic) IBOutlet UIImageView *alertImage;
@property (strong, nonatomic) IBOutlet UILabel *timeLab;
@property (strong, nonatomic) IBOutlet UILabel *sumTimeLab;

@property (strong, nonatomic) IBOutlet UILabel *recieveTitleTimeLab;
@property (strong, nonatomic) IBOutlet UILabel *recieveTimeLab;

@property (strong, nonatomic) IBOutlet UIView *yanhuiContentView;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *yanhuiContentViewHH;

@end

NS_ASSUME_NONNULL_END
