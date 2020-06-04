//
//  MainCell.m
//  WuJieKitchen
//
//  Created by 天津沃天科技 on 2019/5/29.
//  Copyright © 2019年 wotianshiyan. All rights reserved.
//

#import "MainCell.h"
#import "MainSubCell.h"
#import "FoodDetail.h"
#import "TaskDetail.h"
@interface MainCell ()<UITableViewDelegate,UITableViewDataSource>
{
    NSString *indexStr;
    NSString *segStr;
}


@end

@implementation MainCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _typeLab.layer.cornerRadius= _typeLab.frame.size.width/2;
    _typeLab.layer.masksToBounds=YES;
    _mTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _mTable.dataSource=self;
    _mTable.delegate=self;
    [_mTable registerNib:[UINib nibWithNibName:NSStringFromClass([MainSubCell class]) bundle:nil] forCellReuseIdentifier:@"MainSubCell"];
}
-(void)refreshCell:(NSString *)index type:(NSString *)type
{
    indexStr=index;
    segStr=type;
    if ([type isEqualToString:@"0"]) {
        
        _typeLabWW.constant=66;
        _typeLab.hidden=NO;
        _stateLab.text=@"";
    if ([index isEqualToString:@"0"]) {
        _typeLab.text=@"外卖";
        _typeLab.backgroundColor=color(68, 138, 202);
        _typeNameLab.text=@"外卖订单~";
        _timeLab.text=@"接单时间：2018/04/08 11:10";
    }
  
    else     if ([index isEqualToString:@"2"]) {
        _typeLab.text=@"宴会";
        _typeLab.backgroundColor=color(253, 85, 85);
        _typeNameLab.text=@"共 30 桌    桌号：A-001、A-002、A-003...";
        _timeLab.text=@"宴会时间：2018/04/08 午宴";
    }
    else     {
        _typeLab.text=@"堂食";
        _typeLab.backgroundColor=color(254, 106, 16);
        _typeNameLab.text=@"桌号：A-004";
        _timeLab.text=@"下单时间：2018/04/08 11:10";
    }
    }
    else if ([type isEqualToString:@"1"])
    {
        _typeLabWW.constant=0;
        _typeLab.hidden=YES;
        _typeNameLab.text=@"宴会时间：2018/04/08 午宴";
        _timeLab.text=@"共 3 桌   桌号：A-001、A-002、A-003";
        if ([index isEqualToString:@"0"]) {
            _stateLab.text=@"待领取";
             _stateLab.textColor=[UIColor redColor];
        }
       else if ([index isEqualToString:@"1"]) {
            _stateLab.text=@"未开始";
           _stateLab.textColor=[UIColor redColor];
        }
       else {
            _stateLab.text=@"已完成";
           _stateLab.textColor=[UIColor blackColor];
        }
    }
    [_mTable reloadData];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 6;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    MainSubCell *cell=[tableView dequeueReusableCellWithIdentifier:@"MainSubCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
  
    NSString *str1;
    NSString *str2;
 
    if ([segStr isEqualToString:@"0"]) {
        
    
    if([indexStr isEqualToString:@"0"])
    {
        if (indexPath.row==0) {
            cell.nameLab.text=@"菜品A";
            
            cell.stateLab.text=@"待备菜";
            cell.stateLab.textColor=[UIColor blackColor];
            
            str1=@"倒计时:";
            str2=@"00:08:51";
            cell.alertBtn.hidden=YES;
            cell.newsBtn.hidden=YES;
               cell.newsBtnWW.constant=0;
        }
        else   if (indexPath.row==1) {
            cell.nameLab.text=@"菜品A";
            cell.stateLab.text=@"待制作";
            cell.stateLab.textColor=[UIColor blackColor];
            str1=@"倒计时:";
            str2=@"00:00:00";
            cell.alertBtn.hidden=NO;
            cell.newsBtn.hidden=NO;
            [cell.newsBtn setTitle:@"注意制作时间" forState:UIControlStateNormal];
               cell.newsBtnWW.constant=100;
           
        }
        else   if (indexPath.row==2) {
            cell.nameLab.text=@"菜品A";
            cell.stateLab.text=@"待制作";
            cell.stateLab.textColor=[UIColor blackColor];
            str1=@"已超时:";
            str2=@"05:00:00";
            cell.alertBtn.hidden=NO;
            cell.newsBtn.hidden=NO;
            [cell.newsBtn setTitle:@"注意制作时间" forState:UIControlStateNormal];
               cell.newsBtnWW.constant=100;
        }
        else   if (indexPath.row==3) {
            cell.nameLab.text=@"菜品A";
            cell.stateLab.text=@"已完成";
            cell.stateLab.textColor=[UIColor darkGrayColor];
            str1=@"总耗时15分钟";
            str2=@"(超时5分钟)";
            cell.alertBtn.hidden=YES;
            cell.newsBtn.hidden=YES;
               cell.newsBtnWW.constant=0;
         
        }
        else
        {
            cell.nameLab.text=@"菜品A";
            cell.timeLab.text =@"总耗时10分钟";
            cell.stateLab.text=@"已完成";
            cell.stateLab.textColor=[UIColor darkGrayColor];
            cell.alertBtn.hidden=YES;
            cell.newsBtn.hidden=YES;
               cell.newsBtnWW.constant=0;
        }
        if (str2.length!=0&&str1.length!=0) {
            
            cell.timeLab.attributedText = [self attributedText:str1 text:str2 Color:[UIColor redColor]];
        }
   
    }
   else if([indexStr isEqualToString:@"1"])
    {
        if (indexPath.row==0) {
            cell.nameLab.text=@"菜品A";
            
            cell.stateLab.text=@"待备菜";
            cell.stateLab.textColor=[UIColor blackColor];
            
            str1=@"倒计时:";
            str2=@"00:00:00";
            cell.alertBtn.hidden=NO;
            cell.newsBtn.hidden=NO;
            [cell.newsBtn setTitle:@"第一次催单" forState:UIControlStateNormal];
               cell.newsBtnWW.constant=100;
        }
        else   if (indexPath.row==1) {
            cell.nameLab.text=@"菜品A";
            cell.stateLab.text=@"待制作";
            cell.stateLab.textColor=[UIColor blackColor];
            str1=@"倒计时:";
            str2=@"00:00:00";
            cell.alertBtn.hidden=NO;
            cell.newsBtn.hidden=NO;
            [cell.newsBtn setTitle:@"第三次催单" forState:UIControlStateNormal];
               cell.newsBtnWW.constant=100;
        }
     
        else   if (indexPath.row==2) {
            cell.nameLab.text=@"菜品A";
            cell.stateLab.text=@"已完成";
            cell.stateLab.textColor=[UIColor darkGrayColor];
            str1=@"总耗时15分钟";
            str2=@"(提前2分钟)";
            cell.alertBtn.hidden=YES;
            cell.newsBtn.hidden=YES;
               cell.newsBtnWW.constant=0;
            
        }
        else
        {
            cell.nameLab.text=@"菜品A";
            cell.timeLab.text =@"总耗时10分钟";
            cell.stateLab.text=@"已完成";
            cell.stateLab.textColor=[UIColor darkGrayColor];
            cell.alertBtn.hidden=YES;
            cell.newsBtn.hidden=YES;
               cell.newsBtnWW.constant=0;
        }
        if (str2.length!=0&&str1.length!=0) {
        
            if (indexPath.row==0||indexPath.row==1) {
                 cell.timeLab.attributedText = [self attributedText:str1 text:str2 Color:[UIColor redColor]];
            }
            else
            {
            cell.timeLab.attributedText = [self attributedText:str1 text:str2 Color:color(0, 162, 255)];
            }
        }
    }
    else if([indexStr isEqualToString:@"3"])
    {
        if (indexPath.row==0) {
           NSString * nameStr1=@"加菜";
           NSString * nameStr2=@"菜品A";
            NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@ %@",nameStr1,nameStr2]];
            [AttributedStr addAttribute:NSForegroundColorAttributeName
             
                                  value:[UIColor whiteColor]
             
                                  range:NSMakeRange(0, nameStr1.length)];
            [AttributedStr addAttribute:NSBackgroundColorAttributeName
             
                                  value:[UIColor redColor]
             
                                  range:NSMakeRange(0, nameStr1.length)];
            cell.nameLab.attributedText=AttributedStr;
            
            cell.stateLab.text=@"待备菜";
            cell.stateLab.textColor=[UIColor blackColor];
            
            str1=@"倒计时:";
            str2=@"00:00:00";
            cell.alertBtn.hidden=YES;
            cell.newsBtn.hidden=YES;
             cell.newsBtnWW.constant=0;
        }
        else   if (indexPath.row==1) {
            NSString * nameStr1=@"退菜";
            NSString * nameStr2=@"菜品A";
            NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@ %@",nameStr1,nameStr2]];
            [AttributedStr addAttribute:NSForegroundColorAttributeName
             
                                  value:[UIColor whiteColor]
             
                                  range:NSMakeRange(0, nameStr1.length)];
            [AttributedStr addAttribute:NSBackgroundColorAttributeName
             
                                  value:[UIColor lightGrayColor]
             
                                  range:NSMakeRange(0, nameStr1.length)];
            cell.nameLab.attributedText=AttributedStr;
            cell.stateLab.text=@"待备菜";
            cell.stateLab.textColor=[UIColor blackColor];
            cell.timeLab.text =@"已退菜";
          
            cell.alertBtn.hidden=YES;
            cell.newsBtn.hidden=YES;
               cell.newsBtnWW.constant=0;
         
        }
        else
        {
            cell.nameLab.text=@"菜品A";
            cell.timeLab.text =@"总耗时10分钟";
            cell.stateLab.text=@"已完成";
            cell.stateLab.textColor=[UIColor darkGrayColor];
            cell.alertBtn.hidden=YES;
            cell.newsBtn.hidden=YES;
               cell.newsBtnWW.constant=0;
        }
        if (str2.length!=0&&str1.length!=0) {
            
            cell.timeLab.attributedText = [self attributedText:str1 text:str2 Color:[UIColor redColor]];
        }
       
    }
    else
    {
                    cell.nameLab.text=@"菜品A";
                    cell.timeLab.text =@"总耗时10分钟";
                    cell.stateLab.text=@"已完成";
                    cell.stateLab.textColor=[UIColor darkGrayColor];
                    cell.alertBtn.hidden=YES;
                    cell.newsBtn.hidden=YES;
                   cell.newsBtnWW.constant=0;
        }
    }
 else     if ([segStr isEqualToString:@"1"])
    {
        
        
        if([indexStr isEqualToString:@"0"])
        {
            if (indexPath.row==0) {
                cell.nameLab.text=@"菜品A   剩余100份";
                
                cell.stateLab.text=@"待领取";
                cell.stateLab.textColor=[UIColor blackColor];
                
                cell.timeLab.text=@"领取菜品进行制作~";
                cell.alertBtn.hidden=YES;
                cell.newsBtn.hidden=YES;
                cell.newsBtnWW.constant=0;
            }
            else   if (indexPath.row==1) {
                cell.nameLab.text=@"菜品A   剩余50份";
                
                cell.stateLab.text=@"领取中";
                cell.stateLab.textColor=[UIColor blackColor];
                
                cell.timeLab.text=@"王大锤、李小龙";
                cell.alertBtn.hidden=YES;
                cell.newsBtn.hidden=YES;
                cell.newsBtnWW.constant=0;
            }
            else   {
                cell.nameLab.text=@"菜品A  ";
                
                cell.stateLab.text=@"已领取";
                cell.stateLab.textColor=[UIColor darkGrayColor];
                
                cell.timeLab.text=@"王大锤、李小龙";
                cell.alertBtn.hidden=YES;
                cell.newsBtn.hidden=YES;
                cell.newsBtnWW.constant=0;
            }
           
            
        }
        else if([indexStr isEqualToString:@"1"])
        {
            cell.nameLab.text=@"菜品A   ";
            
            cell.stateLab.text=@"未开始";
            cell.stateLab.textColor=[UIColor blackColor];
            
            cell.timeLab.text=@"";
            cell.alertBtn.hidden=YES;
            cell.newsBtn.hidden=YES;
            cell.newsBtnWW.constant=0;
        }
        else
        {
            cell.nameLab.text=@"菜品A   ";
            
            cell.stateLab.text=@"已领取";
            cell.stateLab.textColor=[UIColor darkGrayColor];
            
            cell.timeLab.text=@"王大锤、李小龙";
            cell.alertBtn.hidden=YES;
            cell.newsBtn.hidden=YES;
            cell.newsBtnWW.constant=0;
        }
        
    }
    
    return cell;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 60;
    
}
-(  NSMutableAttributedString *)attributedText:(NSString *)str1 text:(NSString *)str2 Color:(UIColor *)color
{
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@%@",str1,str2]];
    [AttributedStr addAttribute:NSForegroundColorAttributeName
     
                          value:color
     
                          range:NSMakeRange(str1.length, str2.length)];
    return  AttributedStr;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([segStr isEqualToString:@"0"]){
    MainSubCell *cell=[tableView cellForRowAtIndexPath:indexPath];
   FoodDetail *detail=[[FoodDetail alloc]init];
    if ([cell.timeLab.text isEqualToString:@"已退菜"]) {
        detail.order_type=@"已退菜";
    }
    else
    {
        detail.order_type=cell.stateLab.text ;
    }
        detail.type=_typeLab.text;
        [[self viewController] .navigationController pushViewController:detail animated:YES];
    }
    else   if ([segStr isEqualToString:@"1"])
    {
         MainSubCell *cell=[tableView cellForRowAtIndexPath:indexPath];
        TaskDetail *detail=[[TaskDetail alloc]init];
        detail.type=cell.stateLab.text;
        [[self viewController].navigationController pushViewController:detail animated:YES];
    }
}
- (UIViewController *)viewController

{
    
    for (UIView* next = [self superview]; next; next = next.superview) {
        
        UIResponder *nextResponder = [next nextResponder];
        
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            
            return (UIViewController *)nextResponder;
            
        }
        
    }
    
    return nil;
    
}
@end
