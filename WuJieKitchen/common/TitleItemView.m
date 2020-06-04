//
//  TitleItemView.m
//  TitleItemView
//
//  Created by 天津沃天科技 on 2019/6/11.
//  Copyright © 2019年 wotianshiyan. All rights reserved.
//

#import "TitleItemView.h"
#import "LineBtn.h"
@interface TitleItemView (){
  
    UIScrollView      *scrollView;
}
@end
@implementation TitleItemView

-(void)setData:(NSArray *)data
{
    _data=data;
    [self initScrollView];
}


-(void) initScrollView{
    //获取滚动条
    
    if(!scrollView){
        scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width ,self.frame.size.height)];
        scrollView.showsHorizontalScrollIndicator = YES;   //隐藏水平滚动条
        scrollView.showsVerticalScrollIndicator = YES;     //隐藏垂直滚动条
        
        //横竖屏自适应
        scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        
        [scrollView setBackgroundColor:[UIColor whiteColor]];
        
        //添加到当前视图
        [self addSubview:scrollView];
    }else{
        //清除子控件
        for (UIView *view in [scrollView subviews]) {
            [view removeFromSuperview];
        }
    }
    
    if (_data) {
        
        CGFloat offsetX = 0 ,i = 0, h = 50;
        
        //设置滚动文字
        LineBtn *btnText = nil;
        
        NSString *strTitle = [[NSString alloc] init];
        CGFloat itemWidth = 0.0;
        for (   NSDictionary  *model in _data) {
            
            strTitle =model[@"name"];
            
            btnText = [LineBtn buttonWithType:UIButtonTypeCustom];
            
            itemWidth = self.frame.size.width / _data.count;
            
            [btnText setFrame:CGRectMake(itemWidth * i,
                                         0,
                                         itemWidth,
                                         h)];
            
            
            btnText.title=strTitle;
            btnText.num=model[@"num"];
            
            offsetX +=CGRectGetWidth(btnText.bounds) ;
            btnText.userInteractionEnabled = YES;
            
            btnText.tag=i;
            [btnText addTarget:self action:@selector(selectTitle:) forControlEvents:UIControlEventTouchUpInside];
            //添加到滚动视图
            [scrollView addSubview:btnText];
            
            btnText.selected=(i==0)?YES:NO ;
            
            i++;
        }
        [scrollView setContentSize:CGSizeMake(itemWidth * _data.count+50, 0)];
    }
}
#pragma mark scrollView 按钮响应事件
-(void)selectTitle:(LineBtn *)but
{
    if (but.selected) {
        return;
    }
    else
    {
        
        but.selected=YES;
        
        for (LineBtn *button in scrollView.subviews) {
            if ([button isKindOfClass:[LineBtn class]]) {
                if (button.tag!=but.tag) {
                    button.selected=NO;
                }
                
            }
        }
    }
    //  NSString  *model= titleArr[ but.tag];
    
}
@end
