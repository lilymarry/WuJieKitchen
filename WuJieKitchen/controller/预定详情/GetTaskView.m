//
//  GetTaskView.m
//  WuJieKitchen
//
//  Created by 天津沃天科技 on 2019/5/31.
//  Copyright © 2019年 wotianshiyan. All rights reserved.
//

#import "GetTaskView.h"

@interface GetTaskView ()

@end

@implementation GetTaskView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"GetTaskView" owner:self options:nil];
        [self addSubview:_thisView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _thisView.frame = self.bounds;
}

- (IBAction)cancellPress:(id)sender {
    [self removeFromSuperview];
}

@end
