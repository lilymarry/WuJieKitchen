//
//  FoodDetail.m
//  WuJieKitchen
//
//  Created by 天津沃天科技 on 2019/5/29.
//  Copyright © 2019年 wotianshiyan. All rights reserved.
//

#import "FoodDetail.h"
#import "FoodDetailTopView.h"
#import "FoodDetailContentCell.h"
#import "FoodDetailFlowCell.h"
#import "FoodSetView.h"
#import "CookList.h"

@interface FoodDetail ()<UITableViewDelegate,UITableViewDataSource>
{

    FoodDetailTopView *top;
    NSInteger cookNum;
    NSInteger yanhuiContentNum;
    NSArray *detail_titleArr;
     NSArray*detailArr;
}
@property (weak, nonatomic) IBOutlet UITableView *mTable;

@property (strong, nonatomic) IBOutlet UIButton *submitBtn;
@property (strong, nonatomic) IBOutlet UILabel *bagLab;


@end

@implementation FoodDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    _mTable.separatorStyle = UITableViewCellSeparatorStyleNone;
   
    [_mTable registerNib:[UINib nibWithNibName:NSStringFromClass([FoodDetailContentCell class]) bundle:nil] forCellReuseIdentifier:@"FoodDetailContentCell"];

      [_mTable registerNib:[UINib nibWithNibName:NSStringFromClass([FoodDetailFlowCell class]) bundle:nil] forCellReuseIdentifier:@"FoodDetailFlowCell"];
    [self getData];
    cookNum=0;
  
    self.title=@"菜品详情";
 
        
   
    if ([_order_type isEqualToString:@"待备菜"]) {
        cookNum=80;
        [_submitBtn setTitle:@"完成备菜" forState:UIControlStateNormal];
        
        
    }
    else if ([_order_type isEqualToString:@"已退菜"])
    {
        cookNum=80;
        _submitBtn.hidden=YES;
        _bagLab.hidden=YES;
    }
    else if ([_order_type isEqualToString:@"待制作"])
    {
        cookNum=0;
        _submitBtn.hidden=NO;
        [_submitBtn setTitle:@"完成制作" forState:UIControlStateNormal];
    }
    else if ([_order_type isEqualToString:@"待打荷"])
    {
        cookNum=80;
      [_submitBtn setTitle:@"完成打荷" forState:UIControlStateNormal];
        _bagLab.hidden=NO;
        
    }
    else if ([_order_type isEqualToString:@"待配送"])
    {
        cookNum=80;
        [_submitBtn setTitle:@"完成配送" forState:UIControlStateNormal];
       
        
    }
    else if ([_order_type isEqualToString:@"待传菜"])
    {
        cookNum=80;
        [_submitBtn setTitle:@"完成传菜" forState:UIControlStateNormal];      
    }
    else
    {
        cookNum=80;
        _submitBtn.hidden=YES;
        _bagLab.hidden=YES;
        
    }
   
}
-(void)getData
{
    if ([_type isEqualToString:@"外卖"]) {
        yanhuiContentNum=60;
        if (  [_order_type isEqualToString:@"待备菜"]||[_order_type isEqualToString:@"待制作"])
       
        {
            detail_titleArr=[NSArray arrayWithObjects:@"接单时间",@"完成时间", @"订单编号",@"桌台信息",@"切菜工",nil];
            detailArr=[NSArray arrayWithObjects:@"2018/01/02 17:15:54",@"2018/01/02 17:15:54", @"2899 7643 4114",@"外卖订单",@"熊大",nil];
      
        }
        else  if ([_order_type isEqualToString:@"已退菜"]) {
               detail_titleArr=[NSArray arrayWithObjects:@"点菜时间",@"退菜时间", @"退菜理由",@"订单编号",@"桌台信息",@"切菜工",nil];
               detailArr=[NSArray arrayWithObjects:@"2018/01/02 17:15:54",@"2018/01/02 17:15:54",@"上菜太慢", @"2899 7643 4114",@"外卖订单",@"熊大",nil];
           }
        else
        {
            detail_titleArr=[NSArray arrayWithObjects:@"接单时间",@"完成时间", @"订单编号",@"桌台信息",@"切菜工",@"厨师",nil];
            detailArr=[NSArray arrayWithObjects:@"2018/01/02 17:15:54",@"2018/01/02 17:15:54", @"2899 7643 4114",@"外卖订单",@"熊大",@"熊大",nil];
        }
    }
    
    if ([_type isEqualToString:@"堂食"]) {
          yanhuiContentNum=60;
        if (  [_order_type isEqualToString:@"待备菜"]||[_order_type isEqualToString:@"待制作"])
            
        {
            detail_titleArr=[NSArray arrayWithObjects:@"点菜时间",@"完成时间", @"订单编号",@"桌台信息",@"切菜工",@"桌号",nil];
            detailArr=[NSArray arrayWithObjects:@"2018/01/02 17:15:54",@"2018/01/02 17:15:54", @"2899 7643 4114",@"堂食订单",@"熊大",@"A-001",nil];
            
        }
        else  if ([_order_type isEqualToString:@"已退菜"]) {
            detail_titleArr=[NSArray arrayWithObjects:@"点菜时间",@"订单编号", @"桌台信息",@"切菜工",@"桌号",@"退菜时间",@"退菜备注",nil];
            detailArr=[NSArray arrayWithObjects:@"2018/01/02 17:15:54",@"01200 252 252",@"堂食订单", @"熊大",@"A-001",@"2018/01/02 17:15:54",@"热菜不热",nil];
        }
        else
        {
            detail_titleArr=[NSArray arrayWithObjects:@"点菜时间",@"完成时间",@"订单编号", @"桌台信息",@"切菜工",@"桌号",@"厨师",nil];
            detailArr=[NSArray arrayWithObjects:@"2018/01/02 17:15:54",@"2018/01/02 17:15:54",@"01200 252 252",@"堂食订单", @"熊大",@"A-001",@"熊大",nil];
        }
    }
    if ([_type isEqualToString:@"宴会"]) {
        yanhuiContentNum=0;
        if (  [_order_type isEqualToString:@"待备菜"]||[_order_type isEqualToString:@"待制作"])
            
        {
            detail_titleArr=[NSArray arrayWithObjects:@"宴会时间",@"订单编号", @"桌台信息",@"切菜工",@"开菜时间",@"完成时间", @"数量",@"份数",@"桌号",nil];
            detailArr=[NSArray arrayWithObjects:@"2018/01/02 17:15:54",@"01200 252 252",@"宴会订单",@"熊大",@"2018/01/02 17:15:54",@"2018/01/02 17:15:54",@"x2",@"共20份",@"A-001、A-002、A-003、A-004、A-005、A-006、A-007、A-008、A-009、A-010、A-001、A-002、A-003、A-004、A-005、A-006、A-007、A-008、A-009、A-010",nil];
            
        }
        else  if ([_order_type isEqualToString:@"已退菜"]) {
            detail_titleArr=[NSArray arrayWithObjects:@"点菜时间",@"订单编号", @"桌台信息",@"切菜工",@"桌号",@"退菜时间",@"退菜备注",nil];
            detailArr=[NSArray arrayWithObjects:@"2018/01/02 17:15:54",@"01200 252 252",@"堂食订单", @"熊大",@"A-001",@"2018/01/02 17:15:54",@"热菜不热",nil];
        }
        else
        {
            detail_titleArr=[NSArray arrayWithObjects:@"宴会时间",@"订单编号", @"桌台信息",@"切菜工",@"厨师",@"开菜时间",@"完成时间", @"数量",@"份数",@"桌号",nil];
            detailArr=[NSArray arrayWithObjects:@"2018/01/02 17:15:54",@"01200 252 252",@"宴会订单", @"熊大",@"熊大",@"2018/01/02 17:15:54",@"2018/01/02 17:15:54",@"x2",@"共20份",@"A-001、A-002、A-003、A-004、A-005、A-006、A-007、A-008、A-009、A-010、A-001、A-002、A-003、A-004、A-005、A-006、A-007、A-008、A-009、A-010",nil];
        }
    }
    
    
   
}
#pragma mark tableView 代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section==0) {
        return detail_titleArr.count;
    }
    return 6;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        FoodDetailContentCell *cell=[tableView dequeueReusableCellWithIdentifier:@"FoodDetailContentCell"];
        NSString  *str1=detail_titleArr[indexPath.row];
        NSString  *str2=detailArr[indexPath.row];
        NSMutableAttributedString * AttributedStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@: %@",str1,str2]];
        
        
        [AttributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0, str1.length+1)];
         cell.titleLab.attributedText = AttributedStr;

           
            if ([detail_titleArr[indexPath.row]isEqualToString:@"开菜时间"]) {
                cell.lineView.hidden=NO;
            }
            else
            {
                cell.lineView.hidden=YES;
            }
        
        return cell;
    }
    else
    {
        FoodDetailFlowCell *cell=[tableView dequeueReusableCellWithIdentifier:@"FoodDetailFlowCell"];
        if (indexPath.row==0) {
            cell.flowView.image=[UIImage imageNamed:@"流程红"];
            cell.topView.hidden=YES;
      
        }
        else
        {
            cell.flowView.image=[UIImage imageNamed:@"流程灰"];
            cell.topView.hidden=NO;
         
        }
        return cell;
    }
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
         return UITableViewAutomaticDimension;
    }
    else
    {
         return 100;
    }
   
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section==0) {
          return 776-cookNum-yanhuiContentNum;
    }
    return 50;
  
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (section==0) {
         top = [[FoodDetailTopView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 776-cookNum-yanhuiContentNum)];
        top.stateLab.text=_order_type;
        [top.setBtn addTarget:self action:@selector(setPress) forControlEvents:UIControlEventTouchUpInside];
        [top.cookBtn addTarget:self action:@selector(cookPress) forControlEvents:UIControlEventTouchUpInside];
        
        if ([_order_type isEqualToString:@"待备菜"]) {
            top.setBtn.hidden=NO;
            top.cookView.hidden=YES;
            top.cookViewHH.constant=0;
            top.sumTimeLab.hidden=YES;
            
        }
       else if ([_order_type isEqualToString:@"已退菜"])
        {
            top.setBtn.hidden=YES;
            top.cookView.hidden=YES;
            top.cookViewHH.constant=0;
            top.inforBtn.hidden=YES;
            if ([_type isEqualToString:@"堂食"]) {
                top.stateLab.backgroundColor=[UIColor clearColor];
                top.stateLab.textColor=[UIColor redColor];
                top.alertImage.hidden=YES;
                top.timeLab.hidden=YES;
                
            }
            else if ([_type isEqualToString:@"外卖"])
            {
              top.stateLab.backgroundColor=[UIColor lightGrayColor];
              top.stateLab.textColor=[UIColor whiteColor];
            }
             top.sumTimeLab.hidden=YES;
        }
      else  if ([_order_type isEqualToString:@"待制作"])
        {
            top.setBtn.hidden=YES;
            top.cookView.hidden=NO;
            top.cookViewHH.constant=80;
           top.sumTimeLab.hidden=YES;
          
        }
        else
        {
            top.alertImage.hidden=YES;
            top.timeLab.hidden=YES;
            top.sumTimeLab.hidden=NO;
            top.setBtn.hidden=YES;
            top.cookView.hidden=YES;
            top.cookViewHH.constant=0;
            top.inforBtn.hidden=YES;
        }
        
        
        
        if ([_type isEqualToString:@"堂食"]) {
        
            top.recieveTitleTimeLab.text=@"点菜时间";
        }
     
        if ([_type isEqualToString:@"宴会"]) {
            top.recieveTitleTimeLab.text=@"开菜时间";
            top.yanhuiContentView.hidden=NO;
            top.yanhuiContentViewHH.constant=60;
            top.alertImage.hidden=YES;
            top.timeLab.hidden=YES;
        }
        else
        {
            top.yanhuiContentView.hidden=YES;
            top.yanhuiContentViewHH.constant=0;
        }
        
        
        return top;
    }
    else
    {
        UIView *view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, 50)];
        view.backgroundColor=[UIColor groupTableViewBackgroundColor];
        

        UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(0, 10, ScreenW, 40)];
        lab.text=@"  时间备注";
        lab.backgroundColor=[UIColor whiteColor];
        
        [view addSubview:lab];
        return view;
        
    }
   
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
#pragma mark 领料设置
-(void)setPress
{
    FoodSetView *setView=[[FoodSetView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH)];
    [self.view.window addSubview: setView];
}
#pragma mark 一键设置大厨
-(void)cookPress
{
    CookList *list=[[CookList alloc]init];
    [self.navigationController pushViewController:list animated:YES];
}
@end
