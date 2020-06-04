//
//  FoodSetView.m
//  WuJieKitchen
//
//  Created by 天津沃天科技 on 2019/5/30.
//  Copyright © 2019年 wotianshiyan. All rights reserved.
//

#import "FoodSetView.h"
#import "FoodSetViewCell.h"
#import "PopView.h"
@interface FoodSetView ()<UITableViewDelegate,UITableViewDataSource,PopViewDelegate>
{
    NSMutableArray *data;
    
}
@property (weak, nonatomic) IBOutlet UITableView *mTable;
@property (nonatomic,strong) PopView *operationView;
@end

@implementation FoodSetView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"FoodSetView" owner:self options:nil];
        [self addSubview:_thisView];
        
        _mTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mTable.delegate=self;
        _mTable.dataSource=self;
        [_mTable registerNib:[UINib nibWithNibName:NSStringFromClass([FoodSetViewCell class]) bundle:nil] forCellReuseIdentifier:@"FoodSetViewCell"];
        [self getData];
    }
    return self;
}
-(void)getData
{
    data=[NSMutableArray arrayWithObjects:@{@"name":@"香菇 50g",@"content":@"场内存储",@"subContent":@"供应商原材料"}.mutableCopy,
  @{@"name":@"香菇 100g",@"content":@"场内存储",@"subContent":@"供应商原材料"}.mutableCopy,@{@"name":@"香菇 150g",@"content":@"场内存储",@"subContent":@"供应商原材料"}.mutableCopy,@{@"name":@"香菇 200g",@"content":@"场内存储",@"subContent":@"供应商原材料"}.mutableCopy,@{@"name":@"金针菇 150g",@"content":@"场内存储",@"subContent":@"供应商原材料"}.mutableCopy,@{@"name":@"金针菇 200g",@"content":@"场内存储",@"subContent":@"供应商原材料"}.mutableCopy, nil];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    _thisView.frame = self.bounds;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return data.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    FoodSetViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"FoodSetViewCell"];
    cell.but1.appendIndexPath=indexPath;
    cell.but2.appendIndexPath=indexPath;
    [cell.but1 addTarget:self action:@selector(butPress:) forControlEvents:UIControlEventTouchUpInside];
    cell.but1.tag=1000;
    cell.but2.tag=1001;
    [cell.but2 addTarget:self action:@selector(butPress:) forControlEvents:UIControlEventTouchUpInside];
    NSDictionary *dic=data[indexPath.row];
    cell.lab1.text=dic[@"subContent"];
    cell.lab2.text=dic[@"content"];
    cell.nameLab.text=dic[@"name"];
        return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return 70;
}
-(IBAction)cancellPress:(id)sender
{
    [self.operationView dismiss];
    [self removeFromSuperview];
}

- (void)butPress:(PopButton *)sender{
    self.mTable.scrollEnabled=NO;
    UIView *view2=sender.superview;
    [self.superview convertRect:view2.frame fromView:view2];
    CGPoint originInSuperview = [self.superview convertPoint:CGPointZero fromView:view2];
    CGRect targetRect = CGRectMake(originInSuperview.x, originInSuperview.y+CGRectGetHeight(view2.bounds), CGRectGetWidth(view2.bounds), CGRectGetHeight(view2.bounds));
    if (self.operationView.shouldShowed) {
       [self cherkBtnSelect];
        [self.operationView dismiss];
        self.mTable.scrollEnabled=YES;
        return;
    }
    
    [self.operationView showAtView:self.superview rect:targetRect ];
    self.operationView .index=sender.appendIndexPath;
    if (sender.tag==1000) {
        self.operationView .type=@"1";
        FoodSetViewCell *cell=[_mTable cellForRowAtIndexPath:sender.appendIndexPath];
        cell.imageView1.image=[UIImage imageNamed:@"灰色上箭头"];
    }
    else
    {
        self.operationView .type=@"2";
        FoodSetViewCell *cell=[_mTable cellForRowAtIndexPath:sender.appendIndexPath];
           cell.imageView2.image=[UIImage imageNamed:@"灰色上箭头"];
    }
 
}
- (PopView *)operationView {
    if (!_operationView) {
        _operationView = [PopView initailzerOperationView];
        _operationView.delegate=self;
 
    }
    return _operationView;
}
-(void)PopViewName:(NSString *)name index:(NSIndexPath *)indexPath type:(nonnull NSString *)type
{
    self.mTable.scrollEnabled=YES;
    if ([type isEqualToString:@"2"]) {
        //修改数组里某个字典的key对应的值：
        data[indexPath.row][@"content"] = name;
        FoodSetViewCell *cell=[_mTable cellForRowAtIndexPath:indexPath];
        cell.imageView2.image=[UIImage imageNamed:@"灰色下箭头"];
    }
    else
    {
    data[indexPath.row][@"subContent"] = name;
     FoodSetViewCell *cell=[_mTable cellForRowAtIndexPath:indexPath];
    cell.imageView1.image=[UIImage imageNamed:@"灰色下箭头"];
    }
  
    [_mTable reloadData];
}
-(void)cherkBtnSelect
{
    NSArray *cellArr=[_mTable visibleCells];
    for (  FoodSetViewCell *cell in cellArr) {
           cell.imageView1.image=[UIImage imageNamed:@"灰色下箭头"];
           cell.imageView2.image=[UIImage imageNamed:@"灰色下箭头"];
      
    }
}

@end
