
//
//  BFCell.m
//  BookShelf
//
//  Created by metadata on 16/7/25.
//  Copyright © 2016年 metadata. All rights reserved.
//

#import "BFCell.h"

@implementation BFCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self  =  [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor brownColor];
        [self UIConfigure];
    }

    return  self;

}
-(void)countOfButton:(NSInteger)count{
    for (int i=0; i<=count; i++) {
        UIButton * bookBtn = [[UIButton alloc]init];
        bookBtn.backgroundColor = RANDOMCOLOR;
        bookBtn.frame = CGRectMake(10+i*100, 10, 80, 90);
        _scroll.contentSize = CGSizeMake(count*100+100, 100);

        bookBtn.tag = i+10;
        [bookBtn addTarget:self action:@selector(btnCli:) forControlEvents:1<<6];
        [_scroll addSubview: bookBtn];
    }



}

-(void)UIConfigure{
    UIScrollView * scv = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,KScreeenWidth, 110)];
    scv.showsHorizontalScrollIndicator = NO;
    scv.showsVerticalScrollIndicator = NO;
    scv.backgroundColor = [UIColor brownColor];
    _scroll = scv;
    [self.contentView addSubview: scv];
    
    UIView * line = [[UIView alloc]initWithFrame:CGRectMake(0, 110, KScreeenWidth, 1)];
    line.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:line];

    UILabel * classLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 112, 80, 16)];
    _classLab = classLab;
    classLab.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview: classLab];
  
}
-(void)setClassR:(NSArray *)classR{

    _classR = classR;

}
-(void)btnCli:(UIButton*)sender{
    
    if ([self.delegate respondsToSelector:@selector(BFCell:didClickBFBtnTag:currentBFBtn:)]) {
    
        [self.delegate BFCell:self didClickBFBtnTag:sender.tag currentBFBtn:sender];
    }
    
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    
}
@end
