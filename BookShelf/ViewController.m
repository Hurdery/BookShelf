//
//  ViewController.m
//  BookShelf
//
//  Created by metadata on 16/7/25.
//  Copyright © 2016年 metadata. All rights reserved.
//

#import "ViewController.h"
#import "AddClassVC.h"
#import"DetailViewController.h"
#import "BFCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,BFBtnClickDelegate>

@property(nonatomic,strong)UITableView * tabV;
@property(nonatomic,strong)NSArray * classA;
@property(nonatomic,strong)NSMutableArray * classB;
@end

@implementation ViewController
-(NSArray*)classA{

    if (!_classA) {
        _classA = [NSArray arrayWithObjects:@"未分类",@"自然",@"人文",@"社会",@"科学", nil];
    }
    return _classA;
}
-(NSArray*)classB{

    if (!_classB) {
        _classB = [[NSMutableArray alloc]initWithCapacity:0];
        for (int i=0; i<=4; i++) {
            [_classB addObject: [NSString stringWithFormat:@"%d",arc4random()%(5)+6]];
        
        }
    }
    return _classB;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     欢迎交流反馈：2522905745
     
     */
    self.title = @"书架";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addClass)];
    [self creatBFTab];
}
-(void)creatBFTab{
    UITableView * tab = [[UITableView alloc]initWithFrame:self.view.frame style:0];
    tab.delegate =self;
    tab.dataSource = self;
    tab.separatorColor = [UIColor blackColor];
    [self.view addSubview:tab];
    _tabV= tab;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return  self.classA.count;
 
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *rid=@"rid";
    BFCell *cell=[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[BFCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    cell.classLab.text =self.classA[indexPath.row];
    NSInteger count = [self.classB[indexPath.row]integerValue];
    [cell countOfButton:count];
    cell.delegate = self;
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}
-(void)BFCell:(BFCell *)bfcell didClickBFBtnTag:(NSInteger)BFBtnTag currentBFBtn:(UIButton *)sender{

    BFCell *cell = (BFCell *)[[[sender superview]superview]superview];
    NSIndexPath *indexPathAll = [_tabV indexPathForCell:cell];
    NSLog(@"当前点击的是%@行id为%zd",self.classA[indexPathAll.row],BFBtnTag-10);
[UIView animateWithDuration:0.3 animations:^{
    
    sender.transform = CGAffineTransformMakeScale(1.1, 1.1);
    
} completion:^(BOOL finished) {
   
    sender.transform = CGAffineTransformIdentity;
}];
    UIActivityIndicatorView * indicat = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:0];
    indicat.center = self.view.center;
    [indicat startAnimating];
    [self.view addSubview: indicat];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        DetailViewController * detail = [[DetailViewController alloc]init];
        detail.classname =self.classA[indexPathAll.row];
        detail.index =BFBtnTag-10;
        [self.navigationController pushViewController:detail animated:YES];
        [indicat stopAnimating];
    });

    
    
}
-(void)addClass{
    [self.navigationController pushViewController:[[AddClassVC alloc]init] animated:YES];
   
}
@end
