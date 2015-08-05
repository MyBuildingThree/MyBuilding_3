//
//  ADScrollView.m
//  MZeroDemo
//
//  Created by ShenjiGroup on 15/7/31.
//  Copyright (c) 2015年 ShenjiGroup. All rights reserved.
//

#import "ADScrollView.h"

@interface ADScrollView ()<UIScrollViewDelegate>

@property (nonatomic,strong)NSArray *adArray;
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)UIPageControl *pageControl;

@end

@implementation ADScrollView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.8];
        [self createScrollViewAndPageControl];
    }
    return self;
}

- (void)createScrollViewAndPageControl
{
    self.adArray = @[@"aaaaaa", @"bbbbbb", @"ccccccc"];
    
    //实现模糊效果
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    visualEffectView.frame = self.bounds;
    visualEffectView.alpha = 0.7;
    [self addSubview:visualEffectView];
    
    //滚动视图
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    self.scrollView.backgroundColor = [UIColor clearColor];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = YES;
    self.scrollView.showsVerticalScrollIndicator =NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake((self.scrollView.bounds.size.width)*(self.adArray.count), self.scrollView.bounds.size.height);
    [self addSubview:self.scrollView];
    
    //page
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(self.bounds.size.width*0.1, self.bounds.size.height*0.8, self.bounds.size.width*0.8, self.bounds.size.height*0.1)];
    self.pageControl.numberOfPages = self.adArray.count;
    self.pageControl.currentPage = 0;
    self.pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    self.pageControl.userInteractionEnabled = NO;
    [self addSubview:self.pageControl];
    
    
    int originX = self.scrollView.bounds.size.width*0.1;
    for(int i = 0; i<self.adArray.count; i++)
    {
        
        UIView *adView = [[UIView alloc]init];
        adView.backgroundColor = [UIColor whiteColor];
        adView.layer.cornerRadius = 5.0f;
        adView.layer.masksToBounds = YES;
        
        CGRect rect = self.scrollView.frame;
        rect.origin.x = originX;
        rect.origin.y = self.scrollView.bounds.size.height*0.1;
        rect.size.width = self.scrollView.frame.size.width*0.8;
        rect.size.height = self.scrollView.frame.size.height*0.7;
        adView.frame = rect;
        
        [self.scrollView addSubview:adView];
        
        originX += self.scrollView.frame.size.width;
        
        //点击事件
        UITapGestureRecognizer *click = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gestureClick)];
        click.numberOfTouchesRequired = 1;
        click.numberOfTapsRequired =1;
        [adView addGestureRecognizer:click];
        
        //关闭按钮
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(adView.bounds.size.width*0.8, 0, adView.bounds.size.width*0.2, adView.bounds.size.width*0.2)];
        
        //btn.backgroundColor = [UIColor blackColor];
        [btn setTitle:@"X" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [adView addSubview:btn];
    }
    
}

//手势事件
- (void)gestureClick
{
    NSLog(@"%ld",self.pageControl.currentPage);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int cPage = scrollView.contentOffset.x/scrollView.bounds.size.width;
    self.pageControl.currentPage = cPage;
}

//关闭按钮
- (void)btnClick
{
    [self removeFromSuperview];
}

@end
