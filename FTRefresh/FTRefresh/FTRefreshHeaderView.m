//
//  FTRefreshHeaderView.m
//  wsMaijia
//
//  Created by Stubble on 2018/12/10.
//  Copyright © 2018 Stubble. All rights reserved.
//

#import "FTRefreshHeaderView.h"

@implementation FTRefreshHeaderView

+(instancetype)view{
    return [[[NSBundle mainBundle] loadNibNamed:@"FTRefreshHeaderView" owner:nil options:nil] firstObject];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGSize size = [UIScreen mainScreen].bounds.size;
    self.frame = CGRectMake(0, 0, size.width, 380);
}

@end
