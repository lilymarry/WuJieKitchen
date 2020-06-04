//
//  BookDetail.m
//  WuJieKitchen
//
//  Created by 天津沃天科技 on 2019/5/31.
//  Copyright © 2019年 wotianshiyan. All rights reserved.
//

#import "BookDetail.h"
#import "BookDetailCell.h"
#import "FoodDetailContentCell.h"
#import "GetTaskView.h"
#import "TaskDetail.h"
@interface BookDetail ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *infoData1;
   NSArray *infoData2;
    NSInteger cookNum;
    GetTaskView *task;
}
@property (weak, nonatomic) IBOutlet UITableView *mTable;
@property (strong, nonatomic) IBOutlet UILabel *stateLab;

@end

@implementation BookDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    _mTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [_mTable registerNib:[UINib nibWithNibName:NSStringFromClass([BookDetailCell class]) bundle:nil] forCellReuseIdentifier:@"BookDetailCell"];
    
   [_mTable registerNib:[UINib nibWithNibName:NSStringFromClass([FoodDetailContentCell class]) bundle:nil] forCellReuseIdentifier:@"FoodDetailContentCell"];
    [self getData];
    cookNum=0;
    self.title=@"预定详情";
    _stateLab.text=_type;
  
}

-(void)getData
{
    infoData1=@[
               @{
                   @"name"   :@"宴会时间",
                   @"content"  :@"2018/04/08 午宴"
                   },
               @{
                   @"name"   :@"订单编号",
                   @"content"  :@"12345678910"
                   },
               @{
                   @"name"   :@"桌台信息",
                   @"content"  :@"宴会订单"
                   },
               @{
                   @"name"   :@"切菜工",
                   @"content"  :@"王大锤、王二锤、王三锤、王小锤"
                   },
               @{
                   @"name"   :@"厨师",
                   @"content"  :@"王大锤、王二锤、王三锤、王小锤"
                   }
               ];
    infoData2=@[
                @{
                    @"name"   :@"数量",
                    @"content"  :@"x1.5"
                    },
                @{
                    @"name"   :@"份数",
                    @"content"  :@"共需3份"
                    },
                @{
                    @"name"   :@"桌号",
                    @"content"  :@"A-001、A-002、A-003"
                    }
               
                ];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section==0) {
          return 5;
       
    }
    else if (section==1)
    {
        return infoData1.count;
        
    }
    else
    {
         return infoData2.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        
        BookDetailCell *cell=[tableView dequeueReusableCellWithIdentifier:@"BookDetailCell"];
            cell.taskBtn.tag=indexPath.row;
        [cell.taskBtn addTarget:self action:@selector(taskPress:) forControlEvents:UIControlEventTouchUpInside];
         [cell.detailBtn addTarget:self action:@selector(detailPress:) forControlEvents:UIControlEventTouchUpInside];
        if ([_type isEqualToString:@"未开始"]) {
            cell.personNumLab1.hidden=YES;
            cell.personNumLab2.hidden=YES;
            cell.taskBtn.hidden=YES;
             cell.stateLab.text=_type;
        }
        else if([_type isEqualToString:@"已完成"])
        {
            cell.personNumLab1.text=@"切菜工王大锤已领1份";
            cell.personNumLab2.text=@"切菜工王大锤已领2份";
            cell.personNumLab1.hidden=NO;
            cell.personNumLab2.hidden=NO;
            cell.taskBtn.hidden=YES;
             cell.stateLab.text=_type;
        }
        else
        {
            if (indexPath.row==0) {
             
                cell.personNumLab1.hidden=YES;
                cell.personNumLab2.hidden=YES;
                cell.taskBtn.hidden=NO;
                 cell.stateLab.text=@"待领取";
            }
            else if (indexPath.row==1)
            {
                cell.personNumLab1.text=@"切菜工王大锤已领1份";
                cell.personNumLab2.text=@"切菜工王大锤已领2份";
                cell.personNumLab1.hidden=NO;
                cell.personNumLab2.hidden=NO;
                cell.taskBtn.hidden=YES;
                 cell.stateLab.text=@"已领取";
            }
            else if (indexPath.row==2)
            {
                cell.personNumLab1.text=@"切菜工王大锤已领3份";
                cell.personNumLab1.hidden=NO;
                cell.personNumLab2.hidden=YES;
                cell.taskBtn.hidden=YES;
                 cell.stateLab.text=@"已领取";
            }
            else if (indexPath.row==3)
            {
                cell.personNumLab1.text=@"切菜工王大锤已领1份";
                cell.personNumLab1.hidden=NO;
                cell.personNumLab2.hidden=YES;
                cell.taskBtn.hidden=NO;
                  cell.stateLab.text=@"待领取";
            }
            else
            {
                cell.personNumLab1.hidden=YES;
                cell.personNumLab2.hidden=YES;
                cell.taskBtn.hidden=NO;
                  cell.stateLab.text=@"待领取";
            }
                
          
        }
        return cell;
      
    }
    
    else
    {
        FoodDetailContentCell *cell=[tableView dequeueReusableCellWithIdentifier:@"FoodDetailContentCell"];
        if (indexPath.section==1) {
            NSString  *str1=infoData1[indexPath.row][@"name"];
            NSString  *str2=infoData1[indexPath.row][@"content"];
            NSMutableAttributedString * AttributedStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@: %@",str1,str2]];
            
            
            [AttributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0, str1.length+1)];
            cell.titleLab.attributedText = AttributedStr;
               return cell;
        }
        else
        {
            NSString  *str1=infoData2[indexPath.row][@"name"];
            NSString  *str2=infoData2[indexPath.row][@"content"];
            NSMutableAttributedString * AttributedStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@: %@",str1,str2]];
            
            
            [AttributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0, str1.length+1)];
            cell.titleLab.attributedText = AttributedStr;
               return cell;
        }
       
     
    }
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 140;
    }
    else
    {
         return UITableViewAutomaticDimension;
    }
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    if (section==0) {
            return 0.01;
      
    }
    else if(section==1)
    {
          return 60;
    }
    else
    {
        return 20;
    }
    


}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    
    
    if (section==1) {
        UIView *view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, 60)];
        view.backgroundColor=[UIColor groupTableViewBackgroundColor];
        
        
        UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(0, 10, ScreenW, 49)];
        lab.text=@"  订单详情";
        lab.backgroundColor=[UIColor whiteColor];
        
        [view addSubview:lab];
        return view;
    }
    else   if (section==2)
    {
        UIView *view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, 20)];
        view.backgroundColor=[UIColor whiteColor];
        
        
        UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(0, 10, ScreenW, 1)];
      
        lab.backgroundColor=[UIColor groupTableViewBackgroundColor];
        
        [view addSubview:lab];
        return view;
    }
    return nil;

}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
#pragma  mark 任务
-(void)taskPress:(UIButton *)but
{
    task=[[GetTaskView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH)];
    [task.allBtn addTarget:self action:@selector(allPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view.window addSubview:task];
}
#pragma  mark 查看详情
-(void)detailPress:(UIButton *)but
{
    TaskDetail *detail=[[TaskDetail alloc]init];
    detail.type=_type;
    [self.navigationController pushViewController:detail animated:YES];
}
#pragma mark 任务全选择
-(void)allPress
{
    task.allBtn.selected=!task.allBtn.selected;
    
}

@end
