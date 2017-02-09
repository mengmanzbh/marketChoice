//
//  marketChoice.h
//  marketChoice
//
//  Created by 宏鹿 on 2017/2/9.
//  Copyright © 2017年 宏鹿. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol marketChoiceDelegate <NSObject>
/**
 点击事件回调
 */
- (void)marketChoiceDidSelectedAtIndex:(NSInteger)index;

@end


@interface marketChoice : UIView
/**
 代理
 */
@property (nonatomic, weak) id <marketChoiceDelegate> delegate;
@end
