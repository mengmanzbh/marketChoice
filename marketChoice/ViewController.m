//
//  ViewController.m
//  marketChoice
//
//  Created by 宏鹿 on 2017/2/9.
//  Copyright © 2017年 宏鹿. All rights reserved.
//

#import "ViewController.h"
#import "marketChoice.h"
@interface ViewController ()<marketChoiceDelegate>
@property(nonatomic,strong) marketChoice *marketChoiceView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.marketChoiceView = [[marketChoice alloc]initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.bounds), 50)];
    self.marketChoiceView.delegate = self;
    [self.view addSubview:self.marketChoiceView];
}

- (void)marketChoiceDidSelectedAtIndex:(NSInteger)index{
    NSLog(@"%ld",(long)index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
