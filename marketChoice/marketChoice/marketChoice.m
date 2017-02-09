//
//  marketChoice.m
//  marketChoice
//
//  Created by 宏鹿 on 2017/2/9.
//  Copyright © 2017年 宏鹿. All rights reserved.
//

#import "marketChoice.h"
#import "JDragonTypeButtonView.h"
#import "YBPopupMenu.h"

#define TITLES @[@"240分", @"60分", @"15分",@"5分",@"1分"]

#define choiceWidth 80

#define RGBCOLOR(HEX)     [UIColor colorWithRed:((((HEX)>>16)&0xFF))/255. green:((((HEX)>>8)&0xFF))/255.  blue:((((HEX)>>0)&0xFF))/255. alpha:1]

@interface marketChoice ()<JDragonTypeButtonActionDelegate,YBPopupMenuDelegate>

@end

@implementation marketChoice

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}
- (void)setUI
{
    JDragonTypeButtonView  *typeBtnView = [[JDragonTypeButtonView  alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width - choiceWidth, self.bounds.size.height)];
    [typeBtnView setTypeButtonTitles:@[@"分时",@"两日",@"日K",@"周K",@"月K"] withDownLableHeight:2 andDeleagte:self];
    UIColor *hightColor = [UIColor colorWithRed:(198.0/255.0) green:(147.0/255.0) blue:(5.0/255.0) alpha:1];
    [typeBtnView setTypeButtonNormalColor:RGBCOLOR(0x656565) andSelectColor:hightColor];
    typeBtnView.backgroundColor = [UIColor whiteColor];
    [self addSubview:typeBtnView];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.frame = CGRectMake(self.bounds.size.width - choiceWidth, 0, choiceWidth, self.bounds.size.height);
    [button1 setTitle:@"分钟" forState:UIControlStateNormal];
    [button1 setTitleColor:RGBCOLOR(0x656565) forState:UIControlStateNormal];
//    [button1 setTitleColor:hightColor forState:UIControlStateHighlighted];
     button1.titleLabel.font = [UIFont systemFontOfSize:14];
    [button1 addTarget:self action:@selector(butClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:button1];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, self.bounds.size.height - 0.5, self.bounds.size.width, 0.5)];
    line.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self addSubview:line];
}
- (void)butClick:(UIButton*)btn{
    [YBPopupMenu showRelyOnView:btn titles:TITLES icons:nil menuWidth:80 delegate:self];
}
//实现代理
-(void)didClickTypeButtonAction:(UIButton*)button withIndex:(NSInteger)index
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(marketChoiceDidSelectedAtIndex:)]) {
        [self.delegate marketChoiceDidSelectedAtIndex:index];
    }
}
#pragma mark - YBPopupMenuDelegate
- (void)ybPopupMenuDidSelectedAtIndex:(NSInteger)index ybPopupMenu:(YBPopupMenu *)ybPopupMenu
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(marketChoiceDidSelectedAtIndex:)]) {
        [self.delegate marketChoiceDidSelectedAtIndex:index];
    }
}


@end
