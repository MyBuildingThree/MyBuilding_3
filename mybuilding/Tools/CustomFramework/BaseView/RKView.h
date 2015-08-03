//
//  RKView.h
//  ZhuZhan
//
//  Created by 孙元侃 on 15/7/29.
//
//

#import <UIKit/UIKit.h>
#import "RKScrollView.h"

@interface RKView : UIView
@property(nonatomic, weak) id<RKViewDelegate> delegate;
@end
