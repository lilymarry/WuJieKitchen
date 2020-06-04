//
//  CleanMutualStatePopView.m
//  SuperiorAcme
//
//  Created by 天津沃天科技 on 2019/4/11.
//  Copyright © 2019年 GYM. All rights reserved.
//

#import "PopView.h"
#define kXHALbumOperationViewSize CGSizeMake(60, 150)
@interface PopView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, assign) CGRect targetRect;
@property (strong, nonatomic) IBOutlet UITableView *mTable;

@end

@implementation PopView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"PopView" owner:self options:nil];
        [self addSubview:_thisview];
        _mTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _mTable.delegate=self;
        _mTable.dataSource=self;
        
        self.layer.borderColor=[UIColor groupTableViewBackgroundColor].CGColor;
        self.layer.borderWidth=1;
        
    }
    return self;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 12;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
      UITableViewCell *  cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];

    cell.textLabel.text=[NSString stringWithFormat:@"ABCD%ld",indexPath.row+1];
    cell.textLabel.font=[UIFont systemFontOfSize:14];
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 20;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self dismiss];
    UITableViewCell *  cell= [tableView cellForRowAtIndexPath:indexPath];
    [self.delegate PopViewName:cell.textLabel.text index:_index type:_type];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    _thisview.frame = self.bounds;
}

- (void)showAtView:(UIView *)containerView rect:(CGRect)targetRect {
    self.targetRect = targetRect;
    if (self.shouldShowed) {
        return;
    }
    
    [containerView addSubview:self];
    
 
    CGFloat height = kXHALbumOperationViewSize.height;
  
    self.frame = CGRectMake(targetRect.origin.x, targetRect.origin.y,  targetRect.size.width, 0);
    self.shouldShowed = YES;
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.frame = CGRectMake(targetRect.origin.x , targetRect.origin.y , targetRect.size.width, height);
    } completion:^(BOOL finished) {
     
    }];
}
+ (instancetype)initailzerOperationView {
    PopView *operationView = [[PopView alloc] initWithFrame:CGRectZero];
    return operationView;
}

- (void)dismiss {
    if (!self.shouldShowed) {
        return;
    }
    
    self.shouldShowed = NO;
    
    [UIView animateWithDuration:0.25f animations:^{
     [self removeFromSuperview];
      
    } completion:^(BOOL finished) {
    }];
}

@end
