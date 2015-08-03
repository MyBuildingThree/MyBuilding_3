//
//  RKStageChooseView.h
//  ZhuZhan
//
//  Created by 孙元侃 on 15/3/16.
//
//

#import <UIKit/UIKit.h>

@protocol RKStageChooseViewDelegate <NSObject>
@optional
- (void)stageBtnClickedWithNumber:(NSInteger)stageNumber;
- (BOOL)shouldChangeStageToNumber:(NSInteger)stageNumber;
/**
 *  右箭头按钮被点击
 */
- (void)stageChooseViewAssistBtnClicked;
@end

@interface RKStageChooseView : UIView
+(RKStageChooseView*)stageChooseViewWithStages:(NSArray*)stages numbers:(NSArray*)numbers delegate:(id<RKStageChooseViewDelegate>)delegate underLineIsWhole:(BOOL)underLineIsWhole normalColor:(UIColor*)normalColor highlightColor:(UIColor*)highlightColor;
@property(nonatomic,readonly)NSInteger nowStageNumber;

-(void)stageLabelClickedWithSequence:(NSInteger)sequence;
-(void)stageLabelClickedWithSequence:(NSInteger)sequence needResponseDelegate:(BOOL)needResponseDelegate;

-(void)changeNumbers:(NSArray*)numbers;

/**
 *  自身的高度
 */
+ (CGFloat)height;
@end
