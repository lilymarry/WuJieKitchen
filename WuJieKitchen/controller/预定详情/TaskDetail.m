//
//  TaskDetail.m
//  WuJieKitchen
//
//  Created by 天津沃天科技 on 2019/6/3.
//  Copyright © 2019年 wotianshiyan. All rights reserved.
//

#import "TaskDetail.h"
#import "FoodDetailTopView.h"
#import "FoodDetailContentCell.h"
@interface TaskDetail ()<UITableViewDelegate,UITableViewDataSource>
{
    
    FoodDetailTopView *top;
  
    NSArray *detail_titleArr;
    NSArray*detailArr;
}
@property (weak, nonatomic) IBOutlet UITableView *mTable;

@property (strong, nonatomic) IBOutlet UIButton *submitBtn;
@property (strong, nonatomic) IBOutlet UILabel *subtitleLab;
@end

@implementation TaskDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    _mTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [_mTable registerNib:[UINib nibWithNibName:NSStringFromClass([FoodDetailContentCell class]) bundle:nil] forCellReuseIdentifier:@"FoodDetailContentCell"];
    
  
    [self getData];
   
    
    self.title=@"菜品详情";
    
    
    
    if ([_type isEqualToString:@"未开始"]) {
      
    
        _submitBtn.hidden=YES;
        _subtitleLab.text=@"还未开始";


    }
   else if ([_type isEqualToString:@"待领取"]||[_type isEqualToString:@"领取中"]) {
       
        [_submitBtn setTitle:@"领取任务" forState:UIControlStateNormal];
    }
   else  {
     
      _subtitleLab.text=@"任务已被领取";
          _submitBtn.hidden=YES;
   }

}
-(void)getData
{
            detail_titleArr=[NSArray arrayWithObjects:@"宴会时间", @"订单编号",@"桌台信息",@"数量",@"份数",@"桌号",nil];
            detailArr=[NSArray arrayWithObjects:@"2018/01/02 午宴",@"1230 456 455 ", @"宴会订单",@"x1.2",@"共3份",@"A-001，A-002",nil];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
        return detail_titleArr.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
 
        FoodDetailContentCell *cell=[tableView dequeueReusableCellWithIdentifier:@"FoodDetailContentCell"];
        NSString  *str1=detail_titleArr[indexPath.row];
        NSString  *str2=detailArr[indexPath.row];
        NSMutableAttributedString * AttributedStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@: %@",str1,str2]];
        
        
        [AttributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0, str1.length+1)];
        cell.titleLab.attributedText = AttributedStr;
        
        
        if ([detail_titleArr[indexPath.row]isEqualToString:@"数量"]) {
            cell.lineView.hidden=NO;
        }
        else
        {
            cell.lineView.hidden=YES;
        }
        
        return cell;
 
    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        return UITableViewAutomaticDimension;
   
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section==0) {
        return 776-80;
    }
    return 50;
    
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
 
        top = [[FoodDetailTopView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 776-80)];
        top.stateLab.text=_type;
    if ([_type isEqualToString:@"领取中"]) {
          top.stateLab.text=@"待领取";
    }
    top.inforBtn.hidden=YES;
    top.recieveTitleTimeLab.text=@"宴会时间";
    top.recieveTimeLab.text=@"2018/04/08 午宴";
    top.timeLab.text=@"共3桌";
    top.alertImage.hidden=YES;
    top.sumTimeLab.hidden=YES;
    top.setBtn.hidden=YES;
    top.cookView.hidden=YES;
    top.cookViewHH.constant=0;
    
        return top;
 
   
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}


@end
