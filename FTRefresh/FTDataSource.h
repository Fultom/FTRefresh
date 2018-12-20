//
//  FTDataSource.h
//  FTRefresh
//
//  Created by Stubble on 2018/12/20.
//  Copyright © 2018 Stubble. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FTDataSource : NSObject<UITableViewDataSource,UICollectionViewDataSource>

typedef void (^CellConfigureBefore)(id cell, id model, NSIndexPath * indexPath);


@property (nonatomic, strong)  NSMutableArray *dataArray;;

//自定义
- (id)initWithIdentifier:(NSString *)identifier configureBlock:(CellConfigureBefore)before;

//sb
@property (nonatomic, strong) IBInspectable NSString *cellIdentifier;

@property (nonatomic, copy) CellConfigureBefore cellConfigureBefore;


- (void)addDataArray:(NSArray *)datas;

- (id)modelsAtIndexPath:(NSIndexPath *)indexPath;


@end

NS_ASSUME_NONNULL_END
