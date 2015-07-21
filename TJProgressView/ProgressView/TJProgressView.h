//
//  TJProgressView.h
//  TJProgressView
//
//  Created by MJ on 15/7/20.
//  Copyright (c) 2015年 TJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TJProgressView : UIView
/**
 *  进度条值0~1之间
 */
@property(nonatomic,assign)CGFloat progress;

/**
 *  进度条颜色
 */
@property(nonatomic,strong)UIColor *progressColor;

@end
