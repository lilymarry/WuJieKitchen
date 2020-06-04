//
//  MainController.m
//  WuJieKitchen
//
//  Created by 天津沃天科技 on 2019/5/29.
//  Copyright © 2019年 wotianshiyan. All rights reserved.
//

#import "MainController.h"
#import "LineBtn.h"
#import "MainCell.h"
#import "OrderList.h"
#import "BookDetail.h"
@interface MainController ()<UICollectionViewDelegate,UICollectionViewDataSource>{
  
    NSInteger segtype;//segment 制作 预定 估清
    UISegmentedControl *segment;
    NSArray *titleArr;
    UIScrollView      *scrollViewText;
}
@property (weak, nonatomic) IBOutlet UICollectionView *mCollect;
@property (weak, nonatomic) IBOutlet UIView *titleItemView;

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
      [_mCollect registerNib:[UINib nibWithNibName:NSStringFromClass([MainCell class]) bundle:nil] forCellWithReuseIdentifier:@"MainCell"];
    
    [self createNav];
    segtype=0;
    [self getDataWithType:0];
    [self initScrollText];
 
}

- (void)createNav {
    
    
    UIButton * lefthBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    lefthBtn1.frame = CGRectMake(0, 0, 44, 50);
    [lefthBtn1 setImage:[UIImage imageNamed:@"白色返回"] forState:UIControlStateNormal];
    lefthBtn1.imageEdgeInsets = UIEdgeInsetsMake(0,  -20, 0, 0);
    [lefthBtn1 addTarget:self action:@selector(lefthBtnClick) forControlEvents:UIControlEventTouchUpInside];
      UIBarButtonItem * leftBtnItem1 = [[UIBarButtonItem alloc] initWithCustomView:lefthBtn1];
     self.navigationItem.leftBarButtonItem = leftBtnItem1;
    
    
    UIButton * rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(ScreenW-140, 0, 130, 50);
    
    UIBarButtonItem * rightBtnItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightBtnItem;
      if ([_type isEqualToString:@"1"]) {
    [rightBtn addTarget:self action:@selector(rightPress) forControlEvents:UIControlEventTouchUpInside];
      }
    
    UIImageView *_headImaView=[[UIImageView alloc ]initWithFrame:CGRectMake(0, 10, 30, 30)];
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
    
    if ([_type isEqualToString:@"1"]) {
   
    UIView * titleView = [[UIView alloc]initWithFrame:CGRectMake(ScreenW/2-150, 0, 300, 50)];
    titleView.backgroundColor=[UIColor clearColor];
    self.navigationItem.titleView = titleView;
    
    segment=[[UISegmentedControl alloc]initWithItems:@[@"制作",@"预定",@"估清"]];
    segment.frame = CGRectMake(0, 10, titleView.frame.size.width, 30);
    
    segment.selectedSegmentIndex = 0;
    segment.tintColor = [UIColor redColor];
    segment.backgroundColor=[UIColor whiteColor];
    segment.layer.borderColor=[UIColor whiteColor].CGColor;
    segment.layer.borderWidth=2;
    segment.layer.cornerRadius=5;
    segment.layer.masksToBounds=YES;
    
    [segment setTitleTextAttributes:@{
                                      NSForegroundColorAttributeName:[UIColor grayColor]
                                      } forState:UIControlStateNormal];
    
    [segment setTitleTextAttributes:@{
                                      //2.字体颜色
                                      NSForegroundColorAttributeName:[UIColor whiteColor]
                                      } forState:UIControlStateSelected];
    
    [segment addTarget:self action:@selector(segmentChange:) forControlEvents:UIControlEventValueChanged];
 
    [titleView addSubview:segment];
    }
    
}
-(void)rightPress
{   MainController *main=[[MainController alloc]init];
    main.type=@"2";
    [self.navigationController pushViewController:main animated:YES];
  
}
- (void)lefthBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)segmentChange:(UISegmentedControl *)sender
{
    
    segtype= sender.selectedSegmentIndex;
    if (sender.selectedSegmentIndex==0) {
        [self getDataWithType:0];
        [self initScrollText];
    
    }
    else if (sender.selectedSegmentIndex==1)
    {
        [self getDataWithType:1];
        [self initScrollText];
      
    }
   
    [_mCollect reloadData];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 8;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MainCell * commonCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MainCell" forIndexPath:indexPath];
    [commonCell refreshCell:[NSString stringWithFormat:@"%d",(int)indexPath.item] type:[NSString stringWithFormat:@"%d",(int)segtype]];
    
    return commonCell;
}


#pragma mark - =========================== CollectionView的item的布局 =============================
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
   
        return CGSizeMake(ScreenW/2-10,320);
   
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MainCell * cell = (  MainCell *)  [collectionView cellForItemAtIndexPath:indexPath];
    //制作
    if (segtype ==0) {
            //订单详情
            OrderList *list=[[OrderList alloc]init];
            list.type=cell.typeLab.text;
            [self.navigationController pushViewController:list animated:YES];
    }
    //预定
     else  if (segtype ==1) {
        BookDetail *list=[[BookDetail alloc]init];
          list.type=cell.stateLab.text;
        [self.navigationController pushViewController:list animated:YES];
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
        
        CGFloat offsetX = 0 ,i = 0, h = 50;
        
        //设置滚动文字
        LineBtn *btnText = nil;
        
        NSString *strTitle = [[NSString alloc] init];
        CGFloat itemWidth = 0.0;
        for (   NSDictionary  *model in titleArr) {
            
            strTitle =model[@"name"];
            
            btnText = [LineBtn buttonWithType:UIButtonTypeCustom];
         
            itemWidth = ScreenW / titleArr.count;
           
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
-(void)getDataWithType:(NSInteger) t
{
    if (t==0) {
        titleArr=@[
                   @{
                       @"name"   :@"全部",
                       @"num"  :@"0"
                       },
                   @{
                       @"name"   :@"堂食",
                       @"num"  :@"0"
                       },
                   @{
                       @"name"   :@"外卖",
                       @"num"  :@"0"
                       },
                   @{
                       @"name"   :@"宴会",
                       @"num"  :@"0"
                       }
                   
                   ];
    }
    else if (t==1)
    {
        titleArr=@[
                   @{
                       @"name"   :@"全部",
                       @"num"  :@"0"
                       },
                   @{
                       @"name"   :@"未开始",
                       @"num"  :@"3"
                       },
                   @{
                       @"name"   :@"待领取",
                       @"num"  :@"3"
                       },
                   @{
                       @"name"   :@"已完成",
                       @"num"  :@"3"
                       }
                   ];
    }
  
}
@end
