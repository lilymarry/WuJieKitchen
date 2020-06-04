//
//  MainCell.h
//  WuJieKitchen
//
//  Created by 天津沃天科技 on 2019/5/29.
//  Copyright © 2019年 wotianshiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UILabel *typeLab;
@property (strong, nonatomic) IBOutlet UILabel *typeNameLab;
@property (strong, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic)   IBOutlet UITableView *mTable;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *typeLabWW;
@property (strong, nonatomic) IBOutlet UILabel *stateLab;

-(void)refreshCell:(NSString *)index type:(NSString *)type;

@end

NS_ASSUME_NONNULL_END
