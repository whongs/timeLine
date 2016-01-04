//
//  ViewController.m
//  TimeLine
//
//  Created by whs on 16/1/4.
//  Copyright © 2016年 whs. All rights reserved.
//

#import "ViewController.h"
#import "AttenceTimelineCell.h"

@implementation UIView (category)
- (void)borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius{
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = borderWidth;
   
}
#define dataSourceArr @[@"06-13 16:31 提交至店长 shopmanagerA, 确认完毕", @"06-13 16:31 上班考勤 提交成功", @"06-13 16:31 提交至店长 shopmanagerA, 确认完毕", @"06-13 16:31 上班考勤 提交成功", @"06-13 16:31 提交至店长 shopmanagerA, 确认完毕", @"06-13 16:31 上班考勤 提交成功"]
@end

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
}

#pragma mark -UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  dataSourceArr.count;
}
#define TableViewCellID @"TableViewCellID"
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"Cells";
    AttenceTimelineCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[AttenceTimelineCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    bool isFirst = indexPath.row == 0;
    bool isLast = indexPath.row == dataSourceArr.count - 1;
    [cell setDataSource:dataSourceArr[dataSourceArr.count - 1 - indexPath.row] isFirst:isFirst isLast:isLast];
    //[cell borderColor:[UIColor orangeColor] borderWidth:1 cornerRadius:0];
    return cell;
    
}

//设置cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
     return [AttenceTimelineCell cellHeightWithString:dataSourceArr[dataSourceArr.count - 1 - indexPath.row] isContentHeight:NO];

}

#pragma mark UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"indexpath == %ld",(long)indexPath.row);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
