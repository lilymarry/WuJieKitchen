//
//  CookList.m
//  WuJieKitchen
//
//  Created by 天津沃天科技 on 2019/5/30.
//  Copyright © 2019年 wotianshiyan. All rights reserved.
//

#import "CookList.h"
#import "CookListCell.h"
@interface CookList ()<UICollectionViewDelegate,UICollectionViewDataSource>{
   
}
@property (weak, nonatomic) IBOutlet UICollectionView *mCollect;

@end

@implementation CookList

- (void)viewDidLoad {
    [super viewDidLoad];
     [_mCollect registerNib:[UINib nibWithNibName:NSStringFromClass([CookListCell class]) bundle:nil] forCellWithReuseIdentifier:@"CookListCell"];
    self.title=@"设置制作厨师";
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 7;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CookListCell * commonCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CookListCell" forIndexPath:indexPath];
  
    
    return commonCell;
}


#pragma mark - =========================== CollectionView的item的布局 =============================
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(ScreenW/5-10,ScreenW/5*53/48+50+20);
    
    
}

@end
