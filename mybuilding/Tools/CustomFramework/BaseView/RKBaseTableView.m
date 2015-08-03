//
//  RKBaseTableView.m
//  ZhuZhan
//
//  Created by 孙元侃 on 15/3/13.
//
//

#import "RKBaseTableView.h"

@implementation RKBaseTableView
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    if ([self.delegate respondsToSelector:@selector(touchesBeganInRKBaseTableView)]) {
        [self.delegate touchesBeganInRKBaseTableView];
    }
    
    if ([self.delegate respondsToSelector:@selector(baseTableViewTouchesBegan:withEvent:)]){
        [self.delegate baseTableViewTouchesBegan:touches withEvent:event];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesMoved:touches withEvent:event];
    if ([self.delegate respondsToSelector:@selector(baseTableViewTouchesMoved:withEvent:)]) {
        [self.delegate baseTableViewTouchesMoved:touches withEvent:event];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    if ([self.delegate respondsToSelector:@selector(baseTableViewTouchesEnded:withEvent:)]) {
        [self.delegate baseTableViewTouchesEnded:touches withEvent:event];
    }
}

- (void)reloadData{
    [super reloadData];
    
    if (!self.noDataView) return;
    if (![self.dataSource tableView:self numberOfRowsInSection:0]) {
        self.noDataView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        [self addSubview:self.noDataView];
    }else{
        [self.noDataView removeFromSuperview];
    }
}

- (void)setContentSize:(CGSize)contentSize{
    BOOL returnBool = CGSizeEqualToSize(self.contentSize, CGSizeZero) || CGSizeEqualToSize(self.contentSize, contentSize) || self.contentSize.height > contentSize.height || !self.isChatType;
    if (!returnBool){
        CGFloat upHeight = contentSize.height - self.contentSize.height;
        CGPoint contentOffset = self.contentOffset;
        contentOffset.y += upHeight;
        self.contentOffset = contentOffset;
    }
    [super setContentSize:contentSize];
}

- (void)setFrame:(CGRect)frame{
//    {
//        CGFloat upHeight = self.frame.size.height - frame.size.height;
//        CGPoint contentOffset = self.contentOffset;
//        contentOffset.y += upHeight;
//        self.contentOffset = contentOffset;
//    }
    [super setFrame:frame];
}
@end
