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
@property(nonatomic) CGSize size;

@property(nonatomic, strong) RKScrollViewPageController* pageController;
@end

@implementation RKStageViewPageController

- (instancetype)initWithTitles:(NSMutableArray *)titles controllers:(NSMutableArray *)controllers size:(CGSize)size{
    if (self = [super init]) {
        self.titles = titles;
        self.controllers = controllers;
        self.size = size;
        [self setUp];
    }
    return self;
}

- (void)setUp{
    [self.view addSubview:self.stageChooseView];
    [self.view addSubview:self.pageController.scrollView];
    
    [self.pageController.scrollView setMinY:self.stageChooseView.maxY];
}

- (void)stageBtnClickedWithNumber:(NSInteger)stageNumber{
    [self.pageController setCurrentIndex:stageNumber];
}

- (void)scrollViewPageController:(RKScrollViewPageController *)controller changeIndex:(NSInteger)currentIndex{
    [self.stageChooseView stageLabelClickedWithSequence:currentIndex needResponseDelegate:NO];
}

- (void)stageChooseViewAssistBtnClicked{
    if ([self.delegate respondsToSelector:@selector(stageViewPageControllerAssistBtnClicked)]) {
        [self.delegate stageViewPageControllerAssistBtnClicked];
    }
}

- (UIView *)view{
    if (!_view) {
        _view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.size.width, self.size.height)];
    }
    return _view;
}

- (RKStageChooseView *)stageChooseView{
    if (!_stageChooseView) {
        _stageChooseView = [RKStageChooseView stageChooseViewWithStages:self.titles numbers:nil delegate:self underLineIsWhole:NO normalColor:RGBCOLOR(105, 110, 122) highlightColor:RGBCOLOR(34, 192, 100)];
    }
    return _stageChooseView;
}

- (RKScrollViewPageController *)pageController{
    if (!_pageController) {
        _pageController = [[RKScrollViewPageController alloc] initWithControllers:self.controllers pageViewSize:CGSizeMake(self.size.width, self.size.height - [RKStageChooseView height])];
        _pageController.delegate = self;
    }
    return _pageController;
}
@end
