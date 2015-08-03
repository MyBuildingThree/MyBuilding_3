//
//  RKScrollView.h
//  ZhuZhan
//
//  Created by 孙元侃 on 15/7/29.
//
//

#import <UIKit/UIKit.h>
#import "RKScrollViewDelegate.h"

@interface RKScrollView : UIScrollView
@property(nonatomic, weak) id<RKScrollViewDelegate> delegate;
@end
