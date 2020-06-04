//
//  TakeAwayList.m
//  WuJieKitchen
//
//  Created by 天津沃天科技 on 2019/5/30.
//  Copyright © 2019年 wotianshiyan. All rights reserved.
//

#import "OrderList.h"
#import "LineBtn.h"
#import "OrderListCell.h"
#import "FoodDetail.h"
@interface OrderList ()<UICollectionViewDelegate,UICollectionViewDataSource>{
   
    NSArray *titleArr;
    NSArray *numArr;
    UIScrollView      *scrollViewText;
      UIImageView *_headImaView;
}
@property (weak, nonatomic) IBOutlet UICollectionView *mCollect;
@property (weak, nonatomic) IBOutlet UIView *titleItemView;
@property (strong, nonatomic) IBOutlet UILabel *timeTitleLab;
@property (strong, nonatomic) IBOutlet UILabel *timeLab;
@property (strong, nonatomic) IBOutlet UILabel *tableNumLab;

@end

@implementation OrderList

- (void)viewDidLoad {
    [super viewDidLoad];
     [_mCollect registerNib:[UINib nibWithNibName:NSStringFromClass([OrderListCell class]) bundle:nil] forCellWithReuseIdentifier:@"OrderListCell"];
    [self getData];
    [self initScrollText];
    UIButton * rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(ScreenW-140, 0, 130, 50);
    
    UIBarButtonItem * rightBtnItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightBtnItem;
//    if ([_type isEqualToString:@"1"]) {
//        [rightBtn addTarget:self action:@selector(rightPress) forControlEvents:UIControlEventTouchUpInside];
//    }
    
    _headImaView=[[UIImageView alloc ]initWithFrame:CGRectMake(0, 10, 30, 30)];
    _headImaView.layer.masksToBounds = YES;
    _headImaView.layer.cornerRadius = _headImaView.frame.size.width/2;
    _headImaView.layer.borderWidth = 0.1;
    _headImaView.layer.borderColor =[UIColor clearColor].CGColor;
    
    [_headImaView sd_setImageWithURL:[NSURL URLWithString:@"http://test2.wujiemall.com/Uploads/User/pd_user.png"] placeholderImage:[UIImage imageNamed:@"无界优品默认空视图"]];
    [rightBtn addSubview:_headImaView];
    
    
    UILabel *nameLab=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headImaView.frame)+2, 10, 100, 30)];
    nameLab.text=@"切菜工王大锤";
    nameLab.textColor=[UIColor whiteColor];
    [nameLab setFont:[UIFont systemFontOfSize:14]];
    [rightBtn addSubview:nameLab];
   
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 8;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    OrderListCell * commonCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"OrderListCell" forIndexPath:indexPath];
    [commonCell refreshCell:[NSString stringWithFormat:@"%d",(int)indexPath.item] type:_type];
    commonCell.detailBtn.tag=indexPath.item;
    [commonCell.detailBtn addTarget:self action:@selector(detailBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    return commonCell;
}


#pragma mark - =========================== CollectionView的item的布局 =============================
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([_type isEqualToString:@"宴会"]) {
        return CGSizeMake(ScreenW/2-5,380);
    }
    else
    {
        return CGSizeMake(ScreenW/2-5,380-66);
    }
    
    
}
-(void) initScrollText{
    //获取滚动条
    
    if(!scrollViewText){
        scrollViewText = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenW ,50)];
        scrollViewText.showsHorizontalScrollIndicator = YES;   //隐藏水平滚动条
        scrollViewText.showsVerticalScrollIndicator = YES;     //隐藏垂直滚动条
        
        //横竖屏自适应
        scrollViewText.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        
        [scrollViewText setBackgroundColor:[UIColor whiteColor]];
        
        //添加到当前视图
        [_titleItemView addSubview:scrollViewText];
    }else{
        //清除子控件
        for (UIView *view in [scrollViewText subviews]) {
            [view removeFromSuperview];
        }
    }
    
    if (titleArr) {
        
        CGFloat offsetX = 0 ;
        int i = 0, h = 50;
        
        //设置滚动文字
        LineBtn *btnText = nil;
        
        NSString *strTitle = [[NSString alloc] init];
        CGFloat itemWidth = 0.0;
        for (   NSString  *model in titleArr) {
            
            strTitle =model;
            
            btnText = [LineBtn buttonWithType:UIButtonTypeCustom];
            
            itemWidth = ScreenW / titleArr.count;
            
            [btnText setFrame:CGRectMake(itemWidth * i,
                                         0,
                                         itemWidth,
                                         h)];
            btnText.title=strTitle;
            btnText.num=numArr[i];
            offsetX +=CGRectGetWidth(btnText.bounds) ;
            btnText.userInteractionEnabled = YES;
            
            btnText.tag=i;
            [btnText addTarget:self action:@selector(selectTitle:) forControlEvents:UIControlEventTouchUpInside];
            
            //添加到滚动视图
            [scrollViewText addSubview:btnText];
         btnText.selected=(i==0)?YES:NO ;
      
            i++;
        }
        [scrollViewText setContentSize:CGSizeMake(itemWidth * titleArr.count+50, 0)];
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
   
        for (LineBtn *button in scrollViewText.subviews) {
            if ([button isKindOfClass:[LineBtn class]]) {
                if (button.tag!=but.tag) {
                    button.selected=NO;
                }
                
            }
        }
    }
    //  NSString  *model= titleArr[ but.tag];
    
}
-(void)getData
{
    if ([_type isEqualToString:@"外卖"]) {
        titleArr=@[@"全部",@"待备菜",@"待制作",@"待打荷",@"待配送",@"已完成"];
        numArr=@[@"0",@"1",@"3",@"4",@"5",@"0"];
        self.title=@"外卖订单列表";
        _timeTitleLab.text=@"接单时间";
        _tableNumLab.hidden=YES;
    }
    else if ([_type isEqualToString:@"堂食"]) {
        titleArr=@[@"全部",@"待备菜",@"待制作",@"待打荷",@"待传菜",@"已完成",@"已退菜"];
        numArr=@[@"0",@"1",@"3",@"4",@"5",@"0",@"0"];
        self.title=@"堂食订单列表";
        _timeTitleLab.text=@"下单时间";
        _tableNumLab.hidden=YES;
    }
    else
    {
        titleArr=@[@"全部",@"待备菜",@"待制作",@"待打荷",@"待传菜",@"已完成"];
        numArr=@[@"0",@"1",@"3",@"4",@"5",@"0"];
        self.title=@"宴会订单列表";
        _timeTitleLab.text=@"宴会时间";
         _tableNumLab.hidden=NO;
        _timeLab.text=@"2018/04/08 午宴";
    }
   
    
}

-(void)detailBtnPress:(UIButton *)but
{
    NSIndexPath *index=[NSIndexPath indexPathForItem:but.tag inSection:0];
     OrderListCell * commonCell =(  OrderListCell * )[_mCollect cellForItemAtIndexPath:index];
    FoodDetail *detail=[[FoodDetail alloc]init];
  
    detail.order_type=commonCell.stateLab.text;
    
    detail.type=_type;
    [self  .navigationController pushViewController:detail animated:YES];
}

@end
