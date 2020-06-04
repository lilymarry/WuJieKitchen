//
//  TakeAwayBtn.m
//  WuJieManager
//
//  Created by 天津沃天科技 on 2019/5/9.
//  Copyright © 2019年 wotianshiyan. All rights reserved.
//

#import "LineBtn.h"

@interface LineBtn()
@property(strong ,nonatomic)UIView *lineView;
@property(strong ,nonatomic)UILabel *titleLab;
@property(strong ,nonatomic)UILabel *numLab;
@end
@implementation LineBtn


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        _lineView =[[UIView alloc ]init];
        _lineView.backgroundColor=navigationHotelColor;
        [self addSubview:_lineView];
        
        _titleLab =[[UILabel alloc ]init];
        _titleLab.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_titleLab];
        
        _numLab=[[UILabel alloc ]init];
        _numLab.backgroundColor=navigationHotelColor;
        _numLab.textColor=[UIColor whiteColor];
        _numLab.font = [UIFont systemFontOfSize:10.0];
        _numLab.textAlignment=NSTextAlignmentCenter;
   
        
        [self addSubview:_numLab];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
      _lineView .frame=CGRectMake(0, self.bounds.size.height-2, self.bounds.size.width, 1.5);
    
}
-(void)setTitle:(NSString *)title
{
    _titleLab.text=title;
    //18 一个字符的宽度
    _titleLab.frame=CGRectMake(self.bounds.size.width/2-title.length*18/2,5, title.length*18,  self.bounds.size.height-7);
   
}
-(void)setSelected:(BOOL)selected
{
    if (selected) {
        _titleLab.textColor=[UIColor redColor];
        _lineView.hidden=NO;
    }
    else
    {
       _titleLab.textColor=[UIColor blackColor];
        _lineView.hidden=YES;
    }
}
-(void)setNum:(NSString *)num
{
    if (![num isEqualToString:@"0"]) {
        _numLab.hidden=NO;
        _numLab.text=num;
        _numLab.frame=CGRectMake(CGRectGetMaxX(_titleLab.frame), 5, 20, 20);
        _numLab.adjustsFontSizeToFitWidth = YES;
        _numLab.layer.cornerRadius = _numLab.frame.size.width/2;
        _numLab.layer.masksToBounds = YES;
      
    }
    else
    {
        _numLab.hidden=YES;
    }
}
@end
