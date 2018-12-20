//
//  ViewController.m
//  FTRefresh
//
//  Created by Stubble on 2018/12/20.
//  Copyright © 2018 Stubble. All rights reserved.
//

#import "ViewController.h"
#import "FTDataSource.h"
#import "Model.h"
#import "FTRefresh.h"

static NSString *const reuserId = @"reuserId";

@interface ViewController ()
{
    FTRefresh *_refreshHeaderView;
}
@property (nonatomic, strong) UITableView       *tableView;
@property (nonatomic, strong) FTDataSource      *dataSource;
@property (nonatomic, strong) NSMutableArray    *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[FTDataSource alloc] initWithIdentifier:reuserId configureBlock:^(UITableViewCell *cell, Model *model, NSIndexPath *indexPath) {
        cell.textLabel.text  = model.name;
        cell.detailTextLabel.text = model.imageUrl;
        
    }];
    [self.dataSource addDataArray:self.dataArray];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self.dataSource;
    
}

-(void)loadData{
    
    //模拟请求数据
    __weak typeof(self)weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf.dataArray removeAllObjects];
        NSArray *temArray =
        @[
          @{@"name":@"李一",@"imageUrl":@"http://1"},
          @{@"name":@"李二",@"imageUrl":@"http://2"},
          @{@"name":@"李仨",@"imageUrl":@"http://3"},
          @{@"name":@"小李一",@"imageUrl":@"http://4"},
          @{@"name":@"李雾",@"imageUrl":@"http://5"}];
        for (int i = 0; i<temArray.count; i++) {
            
            NSDictionary *dic = temArray[i];
            Model *m = [[Model alloc]init];
            m.name = dic[@"name"];
            m.imageUrl = dic[@"imageUrl"];
            [weakSelf.dataArray addObject:m];
        }
        [weakSelf.dataSource addDataArray:weakSelf.dataArray];
        [self->_refreshHeaderView hide];
        [weakSelf.tableView reloadData];
    });
}

-(NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray arrayWithCapacity:10];
        NSArray *temArray =
        @[
          @{@"name":@"张一",@"imageUrl":@"http://1"},
          @{@"name":@"张二",@"imageUrl":@"http://2"},
          @{@"name":@"张仨",@"imageUrl":@"http://3"},
          @{@"name":@"小张一",@"imageUrl":@"http://4"},
          @{@"name":@"张一张一na",@"imageUrl":@"http://5"},
          @{@"name":@"张一",@"imageUrl":@"http://1"},
          @{@"name":@"张二",@"imageUrl":@"http://2"},
          @{@"name":@"张仨",@"imageUrl":@"http://3"},
          @{@"name":@"小张一",@"imageUrl":@"http://4"},
          @{@"name":@"张一",@"imageUrl":@"http://1"},
          @{@"name":@"张二",@"imageUrl":@"http://2"},
          @{@"name":@"张仨",@"imageUrl":@"http://3"},
          @{@"name":@"小张一",@"imageUrl":@"http://4"},
          @{@"name":@"张一",@"imageUrl":@"http://1"},
          @{@"name":@"张二",@"imageUrl":@"http://2"},
          @{@"name":@"张仨",@"imageUrl":@"http://3"},
          @{@"name":@"小张一",@"imageUrl":@"http://4"},];
        for (int i = 0; i<temArray.count; i++) {
            
            NSDictionary *dic = temArray[i];
            Model *m = [[Model alloc]init];
            m.name = dic[@"name"];
            m.imageUrl = dic[@"imageUrl"];
            [_dataArray addObject:m];
        }
    }
    return _dataArray;
}

- (UITableView *)tableView{
    if (!_tableView) {
        
        //获取状态栏的rect
        CGRect statusRect = [[UIApplication sharedApplication] statusBarFrame];
        //获取导航栏的rect
        CGRect navRect = self.navigationController.navigationBar.frame;
        //那么导航栏+状态栏的高度
        CGFloat height = statusRect.size.height+navRect.size.height;
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, height,self.view.frame.size.width , self.view.frame.size.height - height) style:UITableViewStyleGrouped];
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuserId];
        __weak typeof(self)weakSelf = self;
        if (!_refreshHeaderView) {
            _refreshHeaderView = [FTRefresh new];
            _refreshHeaderView.startBlock = ^{
                [weakSelf loadData];
            };
            _refreshHeaderView.isAutoEnd = false;
            _refreshHeaderView.scrollview = self.tableView;
            
        }
    }
    return _tableView;
}


@end
