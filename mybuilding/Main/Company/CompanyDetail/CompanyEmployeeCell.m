//
//  CompanyEmployeeCell.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/7.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "CompanyEmployeeCell.h"

@implementation CompanyEmployeeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.headImage];
    }
    return self;
}

-(UIImageView *)headImage{
    if(!_headImage){
        _headImage = [[UIImageView alloc] initWithFrame:CGRectMake(14.5, 20.5, 50, 50)];
        _headImage.layer.masksToBounds = YES;
        _headImage.layer.cornerRadius = 25;
        _headImage.backgroundColor = [UIColor yellowColor];
    }
    return _headImage;
}
@end
