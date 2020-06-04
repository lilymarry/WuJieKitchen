//
//  FoodDetailTopView.m
//  WuJieKitchen
//
//  Created by 天津沃天科技 on 2019/5/29.
//  Copyright © 2019年 wotianshiyan. All rights reserved.
//

#import "FoodDetailTopView.h"

@interface FoodDetailTopView ()

@end

@implementation FoodDetailTopView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"FoodDetailTopView" owner:self options:nil];
        [self addSubview:_thisView];
        
        _setBtn.layer.borderWidth=1;
        _setBtn.layer.cornerRadius=5;
        _setBtn.layer.masksToBounds=YES;
        _setBtn.layer.borderColor=navigationHotelColor.CGColor;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _thisView.frame = self.bounds;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
