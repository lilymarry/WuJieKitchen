//
//  CleanMutualStatePopView.h
//  SuperiorAcme
//
//  Created by 天津沃天科技 on 2019/4/11.
//  Copyright © 2019年 GYM. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol PopViewDelegate <NSObject>
-(void)PopViewName:(NSString *)name index:(NSIndexPath *)indexPath type:(NSString *)type;
@end

@interface PopView : UIView
@property (strong, nonatomic) IBOutlet UIView *thisview;
@property (strong, nonatomic) NSIndexPath *index;
@property (strong, nonatomic) NSString *type;
@property (nonatomic, assign) BOOL shouldShowed;
@property (nonatomic,weak)id <PopViewDelegate>  delegate;
+ (instancetype)initailzerOperationView;
- (void)showAtView:(UIView *)containerView rect:(CGRect)targetRect;
- (void)dismiss;
@end

NS_ASSUME_NONNULL_END
