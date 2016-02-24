//
//  ZBBSwitch.m
//  ZBBSwitchDemo
//
//  Created by zhangbinbin on 16/2/24.
//  Copyright © 2016年 zhangbinbin. All rights reserved.
//

#import "ZBBSwitch.h"

#define Line_Color [UIColor colorWithRed:140/255. green:26/255. blue:18/255. alpha:1]
#define NavBar_Bg_Color [UIColor colorWithRed:232/255. green:37/255. blue:23/255. alpha:1.]

@interface ZBBSwitch()
{
    UILabel* _leftLabel;
    UILabel* _rightLabel;
    
    UIColor* _leftLastColor;
}
@end

@implementation ZBBSwitch

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.layer.borderColor = Line_Color.CGColor;
        self.layer.borderWidth = 1.0;
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES;
        
        _leftLabel = [self createLabelWithFrame:CGRectMake(0, 0, frame.size.width / 2., frame.size.height) WithTitle:@"全部" WithFontSize:14.0f];
        [self addSubview:_leftLabel];
        [_leftLabel setBackgroundColor:Line_Color];
        _leftLastColor = _leftLabel.backgroundColor;
        
        _rightLabel = [self createLabelWithFrame:CGRectMake(frame.size.width / 2., 0, frame.size.width / 2., frame.size.height) WithTitle:@"群组" WithFontSize:14.0f];
        [self addSubview:_rightLabel];
        _rightLabel.backgroundColor = NavBar_Bg_Color;
    }
    
    return self;
}

-(void)awakeFromNib
{
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //获取触摸开始时手指的坐标（在self坐标系上
    UITouch *touch=[touches anyObject];
    CGPoint originPoint = [touch locationInView:self];
    
    if (originPoint.x <= self.frame.size.width / 2.)
    {
        [_leftLabel setBackgroundColor:Line_Color];
        _rightLabel.backgroundColor = NavBar_Bg_Color;
    }
    else
    {
        [_leftLabel setBackgroundColor:NavBar_Bg_Color];
        _rightLabel.backgroundColor = Line_Color;
    }
    
    if (!CGColorEqualToColor(_leftLastColor.CGColor, _leftLabel.backgroundColor.CGColor))
    {
        _leftLastColor = _leftLabel.backgroundColor;
        _isOn = !_isOn;
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

-(UILabel*)createLabelWithFrame:(CGRect)frame WithTitle:(NSString*)title WithFontSize:(CGFloat)fontSize
{
    UILabel* label = [[UILabel alloc]initWithFrame:frame];
    label.text = title;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    
    return label;
}

#pragma mark property

-(void)setLeftName:(NSString *)leftName
{
    _leftName = leftName;
    _leftLabel.text = leftName;
}

-(void)setRightName:(NSString *)rightName
{
    _rightName = rightName;
    _rightLabel.text = rightName;
}









@end
