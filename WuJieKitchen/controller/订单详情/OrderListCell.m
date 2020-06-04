//
//  TakeAwayListCell.m
//  WuJieKitchen
//
//  Created by 天津沃天科技 on 2019/5/30.
//  Copyright © 2019年 wotianshiyan. All rights reserved.
//

#import "OrderListCell.h"
#import "OrderListSubCell.h"
@interface OrderListCell ()<UITableViewDelegate,UITableViewDataSource>
{
    NSString *indexStr;
   NSString *typeStr;
}

@property (strong, nonatomic) IBOutlet UILabel *subStateLab;
@property (weak, nonatomic) IBOutlet UITableView *mTable;
@property (strong, nonatomic) IBOutlet UIButton *alertBtn;

@property (strong, nonatomic) IBOutlet UILabel *jishiTitleLab;
@property (strong, nonatomic) IBOutlet UILabel *jishiLab;

@property(weak,nonatomic)IBOutlet UIView *flagView;
@property(weak,nonatomic)IBOutlet UIView *backView;
@property (strong, nonatomic) IBOutlet UILabel *flagLab;
@property (strong, nonatomic) IBOutlet UILabel *timeTitleLab;




@end
@implementation OrderListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _mTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _mTable.dataSource=self;
    _mTable.delegate=self;
    [_mTable registerNib:[UINib nibWithNibName:NSStringFromClass([OrderListSubCell class]) bundle:nil] forCellReuseIdentifier:@"OrderListSubCell"];
    CGAffineTransform transform= CGAffineTransformMakeRotation(-M_PI*0.2);

    _flagView.transform = transform;//旋转
    
    _backView.clipsToBounds=YES;
    
    
}
-(void)refreshCell:(NSString *)index type:(NSString *)type
{
    indexStr=index;
    typeStr=type;
    if ([typeStr isEqualToString:@"外卖"]) {
        _timeTitleLab.text=@"接单时间：";
        _yanhuiHHH.constant=0;
        _yanhuiView.hidden=YES;
    if ([indexStr isEqualToString:@"0"]) {
        _stateLab.text=@"待备菜";
        _subStateLab.text=@"等待备菜";
         _subStateLab.hidden=NO;
    }
   else if ([indexStr isEqualToString:@"1"]) {
        _stateLab.text=@"待制作";
       _subStateLab.text=@"等待制作";
         _subStateLab.hidden=NO;
    }
   else if ([indexStr isEqualToString:@"2"]) {
       _stateLab.text=@"待打荷";
       _subStateLab.text=@"等待打荷";
         _subStateLab.hidden=NO;
   }
   else if ([indexStr isEqualToString:@"3"]) {
       _stateLab.text=@"待配送";
       _subStateLab.text=@"等待配送";
         _subStateLab.hidden=NO;
   }
   else if ([indexStr isEqualToString:@"4"]) {
       _stateLab.text=@"已完成";
         _subStateLab.hidden=YES;
      
   }
    else
    {
         _stateLab.text=@"已完成";
         _subStateLab.hidden=YES;
    }
    
    
    
    if ([indexStr isEqualToString:@"0"]||[indexStr isEqualToString:@"1"]) {
        _alertBtn.hidden=NO;
    }
    else {
        _alertBtn.hidden=YES;
    }
    NSString *str1=@"20分钟";
    
    if ([indexStr isEqualToString:@"4"]) {
        _jishiTitleLab.text=@"已完成";
        NSString *str2=@"提前(20分钟)";
          _jishiLab.textColor=[UIColor lightGrayColor];
        _jishiLab.attributedText= [self attributedText:str1 text:str2 Color:color(0, 160, 233)];
        
    }
    else if ([indexStr isEqualToString:@"5"]) {
        _jishiTitleLab.text=@"已完成";
         NSString *str2=@"超时(20分钟)";
            _jishiLab.textColor=[UIColor lightGrayColor];
           _jishiLab.attributedText= [self attributedText:str1 text:str2 Color:[UIColor redColor]];
    }
    
    else
    {
       _jishiTitleLab.text=@"倒计时";
        _jishiLab.text=@"00:00:10";
        _jishiLab.textColor=[UIColor redColor];
    }
   
    
    if ([indexStr isEqualToString:@"0"]) {
        _flagView.hidden=NO;
        _flagLab.text=@"注意制作时间";
    }
    else
    {
        _flagView.hidden=YES;
    }
    }
    if ([typeStr isEqualToString:@"堂食"]) {
        _yanhuiHHH.constant=0;
        _yanhuiView.hidden=YES;
          _timeTitleLab.text=@"点菜时间：";
        if ([indexStr isEqualToString:@"0"]) {
            _stateLab.text=@"待备菜";
            _subStateLab.text=@"等待备菜";
            _subStateLab.hidden=NO;
        }
        else if ([indexStr isEqualToString:@"1"]) {
            _stateLab.text=@"已退菜";
       
            _subStateLab.hidden=YES;
        }
        else if ([indexStr isEqualToString:@"2"]) {
            _stateLab.text=@"待打荷";
            _subStateLab.text=@"等待打荷";
            _subStateLab.hidden=NO;
        }
        else if ([indexStr isEqualToString:@"3"]) {
            _stateLab.text=@"待制作";
            _subStateLab.text=@"等待制作";
            _subStateLab.hidden=NO;
        }
        else if ([indexStr isEqualToString:@"4"]) {
            _stateLab.text=@"待传菜";
            _subStateLab.text=@"等待传菜";
            _subStateLab.hidden=NO;
            
        }
        else
        {
            _stateLab.text=@"已完成";
            _subStateLab.hidden=YES;
        }
        
        
        
        if ([indexStr isEqualToString:@"2"]||[indexStr isEqualToString:@"3"]) {
            _alertBtn.hidden=NO;
        }
        else {
            _alertBtn.hidden=YES;
        }
        
        NSString *str1=@"20分钟";
        if ([indexStr isEqualToString:@"1"]) {
            _jishiTitleLab.text=@"退菜时间";
            _jishiLab.textColor=[UIColor lightGrayColor];
            _jishiLab.text=@"2018/04/08 10:52";
            
        }
      else  if ([indexStr isEqualToString:@"4"]) {
            _jishiTitleLab.text=@"已完成";
            NSString *str2=@"提前(20分钟)";
            _jishiLab.textColor=[UIColor lightGrayColor];
            _jishiLab.attributedText= [self attributedText:str1 text:str2 Color:color(0, 160, 233)];
            
        }
        else if ([indexStr isEqualToString:@"5"]) {
            _jishiTitleLab.text=@"已完成";
            NSString *str2=@"超时(20分钟)";
            _jishiLab.textColor=[UIColor lightGrayColor];
            _jishiLab.attributedText= [self attributedText:str1 text:str2 Color:[UIColor redColor]];
        }
        
        else
        {
            _jishiTitleLab.text=@"倒计时";
            _jishiLab.text=@"00:00:10";
            _jishiLab.textColor=[UIColor redColor];
        }
        
        
        if ([indexStr isEqualToString:@"2"]) {
            _flagView.hidden=NO;
            _flagLab.text=@"第三次催单";
        }
        else
        {
            _flagView.hidden=YES;
        }
    }
    if ([typeStr isEqualToString:@"宴会"]) {
        
        _yanhuiHHH.constant=66;
        _yanhuiView.hidden=NO;
        _timeTitleLab.text=@"开菜时间：";
        _flagView.hidden=YES;
        _alertBtn.hidden=YES;
        if ([indexStr isEqualToString:@"0"]) {
            _stateLab.text=@"待备菜";
            _subStateLab.text=@"等待备菜";
            _subStateLab.hidden=NO;
        }
        else if ([indexStr isEqualToString:@"1"]) {
            _stateLab.text=@"已退菜";
            
            _subStateLab.hidden=YES;
        }
        else if ([indexStr isEqualToString:@"2"]) {
            _stateLab.text=@"待打荷";
            _subStateLab.text=@"等待打荷";
            _subStateLab.hidden=NO;
        }
        else if ([indexStr isEqualToString:@"3"]) {
            _stateLab.text=@"待制作";
            _subStateLab.text=@"等待制作";
            _subStateLab.hidden=NO;
        }
        else if ([indexStr isEqualToString:@"4"]) {
            _stateLab.text=@"待传菜";
            _subStateLab.text=@"等待传菜";
            _subStateLab.hidden=NO;
            
        }
        else
        {
            _stateLab.text=@"已完成";
            _subStateLab.hidden=YES;
        }
        
        
        NSString *str1=@"20分钟";
   
        if ([indexStr isEqualToString:@"4"]) {
            _jishiTitleLab.text=@"已完成";
            NSString *str2=@"提前(20分钟)";
            _jishiLab.textColor=[UIColor lightGrayColor];
            _jishiLab.attributedText= [self attributedText:str1 text:str2 Color:color(0, 160, 233)];
            
        }
        else if ([indexStr isEqualToString:@"5"]) {
            _jishiTitleLab.text=@"已完成";
            NSString *str2=@"超时(20分钟)";
            _jishiLab.textColor=[UIColor lightGrayColor];
            _jishiLab.attributedText= [self attributedText:str1 text:str2 Color:[UIColor redColor]];
        }
        
        else
        {
            _jishiTitleLab.text=@"倒计时";
            _jishiLab.text=@"00:00:10";
            _jishiLab.textColor=[UIColor redColor];
        }
        
    }
    [_mTable reloadData];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 6;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    OrderListSubCell *cell=[tableView dequeueReusableCellWithIdentifier:@"OrderListSubCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row==0) {
        cell.nameLab.text=@"香菜";
        cell.subNameLab.text=@"不要香菜";
    }
    else if (indexPath.row==1)
    {
         cell.nameLab.text=@"蒜";
         cell.subNameLab.text=@"加蒜50g";
    }
    else
    {
        cell.nameLab.text=@"加菜";
         cell.subNameLab.text=@"鱼豆腐5g*2 、象拔蚌5g*1 、韭菜5g*1 肥肠5g*1";
    }
    
    if (indexPath.row<2) {
        //blue
          cell.subNameLab.textColor=color(0, 160, 233);
        
         cell.nameLab.textColor=color(0, 160, 233);
         cell.nameLab.layer.borderColor=color(0, 160, 233).CGColor;
         cell.nameLab.backgroundColor=color(197, 233, 250);
    }
    else
    {
          cell.subNameLab.textColor=color(247, 160, 8);
        
        cell.nameLab.textColor=color(247, 160, 8);
        cell.nameLab.layer.borderColor=color(247, 160, 8).CGColor;
        cell.nameLab.backgroundColor=color(253, 232, 197);
    }
    return cell;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return UITableViewAutomaticDimension;
    
}
-(  NSMutableAttributedString *)attributedText:(NSString *)str1 text:(NSString *)str2 Color:(UIColor *)color
{
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@%@",str1,str2]];
    [AttributedStr addAttribute:NSForegroundColorAttributeName
     
                          value:color
     
                          range:NSMakeRange(str1.length, str2.length)];
    return  AttributedStr;
}
@end
