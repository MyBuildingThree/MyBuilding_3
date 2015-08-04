//
//  RKStageViewPageController.h
//  ZhuZhan
//
//  Created by 孙元侃 on 15/7/30.
//
//

#import <Foundation/Foundation.h>

@protocol RKStageViewPageControllerDelegate <NSObject>
- (void)stageViewPageControllerAssistBtnClicked;
@end

/**
 控制着一个scrollView和阶段条
 */
@interface RKStageViewPageController : NSObject
/**
 *  初始化方法,其中titles与controllers的count必须一致
 */
- (instancetype)initWithTitles:(NSMutableArray*)/*NSString*/titles controllers:(NSMutableArray*)/*RKPageController*/controllers size:(CGSize)size;

@property(nonatomic, strong) UIView* view;

@property(nonatomic, weak) id<RKStageViewPageControllerDelegate> delegate;

@end
