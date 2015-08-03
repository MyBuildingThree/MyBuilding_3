//
//  RKTestController.h
//  ZhuZhan
//
//  Created by 孙元侃 on 15/7/31.
//
//

#import "RKController.h"

@protocol RKTestControllerDelgegate <NSObject>

- (void)firstLoad;

@end

@interface RKTestController : RKController<RKTestControllerDelgegate>

@end
