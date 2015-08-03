//
//  RKViewDelegate.h
//  ZhuZhan
//
//  Created by 孙元侃 on 15/7/29.
//
//

#ifndef ZhuZhan_RKViewDelegate_h
#define ZhuZhan_RKViewDelegate_h

@protocol RKViewDelegate <NSObject>
@optional
- (void)willMoveToSuperview:(UIView *)newSuperview;
@end

#endif
