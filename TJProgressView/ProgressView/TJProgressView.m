//
//  TJProgressView.m
//  TJProgressView
//
//  Created by MJ on 15/7/20.
//  Copyright (c) 2015年 TJ. All rights reserved.
//

#import "TJProgressView.h"
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define kLabelHeight 24.f //label高度
#define kMargin 5.f; //主要为了兼容百分比逼近百分百的时候label的位置在适合的位置
@interface TJProgressView ()
{
    UIView *progressView; //进度条view
    UILabel *lblPercent;  //显示百分比的label

}
@end
@implementation TJProgressView
- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setUp];
}
- (void)setUp
{
    self.backgroundColor = [UIColor colorWithWhite:0.869 alpha:1.000];
    /**创建progressView*/
    progressView = [[UIView alloc]init];
    progressView.frame = CGRectMake(0, self.bounds.origin.y+self.bounds.size.height, self.bounds.size.width, 0);
    progressView.backgroundColor = UIColorFromRGB(0xec5d5f);
    [self addSubview:progressView];
    
    /**创建lblPercent*/
    lblPercent = [[UILabel alloc]init];
    lblPercent.textColor = [UIColor redColor];
    lblPercent.backgroundColor = [UIColor clearColor];
    lblPercent.textAlignment = NSTextAlignmentCenter;
    lblPercent.font = [UIFont systemFontOfSize:13.f];
    lblPercent.frame = CGRectMake(0, self.bounds.origin.y+self.bounds.size.height-kLabelHeight, self.bounds.size.width, kLabelHeight);
    [self addSubview:lblPercent];
}
/**
 *  设置进度条的值
 *
 *  @param progress 进度条值
 */
- (void)setProgress:(CGFloat)progress
{
    
    if (progress<0.f)
    {
        _progress = 0.f;
    }
    else if (progress<=1.f)
    {
        _progress = progress;
    }
    else
    {
        _progress = 1.f;
    }
    
    /**重置进度条和label的frame*/
     progressView.frame = CGRectMake(0, self.bounds.origin.y+self.bounds.size.height, self.bounds.size.width, 0);
     lblPercent.frame = CGRectMake(0, self.bounds.origin.y+self.bounds.size.height-kLabelHeight, self.bounds.size.width, kLabelHeight);
    
    [UIView animateWithDuration:0.5 delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        /**设置进度条的高度*/
        CGRect newRect = progressView.frame;
        newRect.size.height = -((_progress)*self.bounds.size.height);
        progressView.frame = newRect;
       
        /**设置label的y坐标*/
        CGRect lblRect = lblPercent.frame;
        lblRect.origin.y = self.bounds.origin.y+self.bounds.size.height-((_progress)*self.bounds.size.height)-kLabelHeight+kMargin ;
        lblPercent.frame = lblRect;

    } completion:^(BOOL finished) {
       
       
    }];
    /**获取label百分比以及设置富文本颜色和字体大小*/
    NSString *result = [NSString stringWithFormat:@"%ld%%",(long)(_progress*100)];
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc]initWithString:result];
    NSDictionary *dic_Attribute =
                        @{
                          NSForegroundColorAttributeName :
                              [UIColor colorWithRed:0.261
                                              green:0.223
                                               blue:0.284 alpha:1.000],
                          NSFontAttributeName :
                              [UIFont systemFontOfSize:8.f]
                          };
    [attributeString addAttributes:dic_Attribute range:NSMakeRange(result.length-1, 1)];
    lblPercent.attributedText = attributeString;
    
}
/**
 *  设置进度条背景颜色
 *
 *  @param progressColor 进度条颜色
 */
- (void)setProgressColor:(UIColor *)progressColor
{
    _progressColor = progressColor;
    progressView.backgroundColor = _progressColor;
}
@end
