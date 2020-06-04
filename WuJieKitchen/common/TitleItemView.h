//
//  TitleItemView.h
//  TitleItemView
//
//  Created by 天津沃天科技 on 2019/6/11.
//  Copyright © 2019年 wotianshiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TitleItemView : UIView
@property(nonatomic, strong)NSArray *data;
@property(nonatomic, assign)BOOL autoScroll;//是否滚动
@end

NS_ASSUME_NONNULL_END
