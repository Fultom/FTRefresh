
# FTRefresh

随着手指的下来 小猫渐渐地从盒子里出来
```
if (!_refreshHeaderView) {
            _refreshHeaderView = [FTRefresh new];
            _refreshHeaderView.startBlock = ^{
                [weakSelf loadData];
            };
            //是否主动停止
            _refreshHeaderView.isAutoEnd = false;
            _refreshHeaderView.scrollview = self.tableView;
            
        }

//如果选择不是主动停止那么一定要调用这个方法才会结束
[_refreshHeaderView hide];




```
￼￼
![image](https://github.com/571339371/FTRefresh/blob/master/FTRefresh/Pasted%20Graphic.png)

