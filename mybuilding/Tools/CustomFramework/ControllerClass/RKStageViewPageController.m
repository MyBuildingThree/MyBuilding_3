//
//  RKStageViewPageController.m
//  ZhuZhan
//
//  Created by 孙元侃 on 15/7/30.
//
//

#import "RKStageViewPageController.h"
#import "RKStageChooseView.h"
#import "RKScrollViewPageController.h"
#import "UIView+ViewKit.h"
@interface RKStageViewPageController ()<RKStageChooseViewDelegate,RKScrollViewPageControllerDelegate>
@property(nonatomic, strong) NSMutableArray* titles;
@property(nonatomic, strong) NSMutableArray* controllers;

@property(nonatomic, strong) RKStageChooseView* stageChooseView;
@property(nonatomic, strong) RKScrollViewPageController* pageController;
@end

@implementation RKStageViewPageController

- (instancetype)initWithTitles:(NSMutableArray *)titles controllers:(NSMutableArray *)controllers{
    if (self = [super init]) {
        self.titles = titles;
        self.controllers = controllers;
        [self setUp];
    }
    return self;
}

- (void)setUp{
    [self.view addSubview:self.stageChooseView];
    [self.view insertSubview:self.pageController.scrollView atIndex:0];
    
    [self.pageController.scrollView setMinY:self.stageChooseView.maxY];
}

- (void)stageBtnClickedWithNumber:(NSInteger)stageNumber{
    self.pageController.currentIndex = stageNumber;
}

- (void)scrollViewPageController:(RKScrollViewPageController *)controller changeIndex:(NSInteger)currentIndex{
    [self.stageChooseView stageLabelClickedWithSequence:currentIndex needResponseDelegate:NO];
}

- (UIView *)view{
    if (!_view) {
        _view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 400)];
        _view.backgroundColor = [UIColor colorWithRed:.5 green:.5 blue:1 alpha:.5];
    }
    return _view;
}

- (RKStageChooseView *)stageChooseView{
    if (!_stageChooseView) {
        _stageChooseView = [RKStageChooseView stageChooseViewWithStages:self.titles numbers:nil delegate:self underLineIsWhole:YES normalColor:nil highlightColor:nil];
    }
    return _stageChooseView;
}

- (RKScrollViewPageController *)pageController{
    if (!_pageController) {
        _pageController = [[RKScrollViewPageController alloc] initWithControllers:self.controllers];
        _pageController.delegate = self;
    }
    return _pageController;
}
@end
