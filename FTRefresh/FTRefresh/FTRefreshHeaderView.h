//
//  FTRefreshHeaderView.h
//  wsMaijia
//
//  Created by Stubble on 2018/12/10.
//  Copyright © 2018 Stubble. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define FTRefreshBGViewHeight 380.0

@interface FTRefreshHeaderView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *icon;//图片
@property (weak, nonatomic) IBOutlet UILabel *prompt;//动态提示文字
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconBottom;

+(instancetype)view;

@end

NS_ASSUME_NONNULL_END
