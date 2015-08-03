//
//  RKStageViewPageController.h
//  ZhuZhan
//
//  Created by 孙元侃 on 15/7/30.
//
//

#import <Foundation/Foundation.h>

@interface RKStageViewPageController : NSObject

/**
 *  初始化方法,其中titles与controllers的count必须一致
 */
- (instancetype)initWithTitles:(NSMutableArray*)/*NSString*/titles controllers:(NSMutableArray*)/*RKController*/controllers;

@property(nonatomic, strong) UIView* view;

@end
