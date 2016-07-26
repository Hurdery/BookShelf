//
//  BFCell.h
//  BookShelf
//
//  Created by metadata on 16/7/25.
//  Copyright © 2016年 metadata. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BFCell;
@protocol BFBtnClickDelegate <NSObject>

-(void)BFCell:(BFCell*)bfcell didClickBFBtnTag:(NSInteger)BFBtnTag currentBFBtn:(UIButton*)sender;

@end

@interface BFCell : UITableViewCell
@property(nonatomic,strong)UILabel * classLab;
@property(nonatomic,strong)NSArray * classR;
@property(nonatomic,strong)UIScrollView * scroll;
@property(nonatomic,weak)id<BFBtnClickDelegate> delegate;
-(void)countOfButton:(NSInteger)count;
@end
