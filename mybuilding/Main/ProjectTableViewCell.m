//
//  ProjectTableViewCell.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "ProjectTableViewCell.h"
#import "RKViewFactory.h"
#import "RKShadowView.h"

@implementation ProjectTableViewCell

+(CGFloat)carculateCellHeightWithModel:(ProjectModel *)cellModel{
    CGFloat height = 0;
    height += [RKViewFactory autoLabelWithMaxWidth:280 maxHeight:40 font:[UIFont systemFontOfSize:14] content:cellModel.a_description];
    height +=200;
    return height;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.PCDLabel];
        [self.contentView addSubview:self.projectName];
        [self.contentView addSubview:self.cutLine1];
        [self.contentView addSubview:self.projectStage];
        [self.contentView addSubview:self.investment];
        [self.contentView addSubview:self.area];
    }
    return self;
}

-(void)setModel:(ProjectModel *)model{
    NSLog(@"%@",model.a_projectName);
    self.PCDLabel.text = [NSString stringWithFormat:@"%@ %@ %@",model.a_province,model.a_city,model.a_district];
    self.projectName.text = model.a_projectName;
    self.projectStage.text = model.a_projectstage;
    self.investment.text = model.a_investment;
    self.area.text = model.a_area;
}

-(UILabel *)PCDLabel{
    if(!_PCDLabel){
        _PCDLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, kScreenWidth-40, 20)];
        _PCDLabel.font = [UIFont systemFontOfSize:14];
        _PCDLabel.textColor = BlueColor;
        _PCDLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _PCDLabel;
}

-(UILabel *)projectName{
    if(!_projectName){
        _projectName = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, kScreenWidth-40, 20)];
        _projectName.font = [UIFont systemFontOfSize:16];
        _projectName.textAlignment = NSTextAlignmentLeft;
    }
    return _projectName;
}

-(UIImageView *)cutLine1{
    if(!_cutLine1){
        _cutLine1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 55, kScreenWidth, 1)];
        _cutLine1.backgroundColor = [UIColor lightGrayColor];
    }
    return _cutLine1;
}

-(UILabel *)projectStage{
    if(!_projectStage){
        _projectStage = [[UILabel alloc] initWithFrame:CGRectMake(20, 65, (kScreenWidth-40)/3, 20)];
        _projectStage.textColor = BlueColor;
        _projectStage.font = [UIFont systemFontOfSize:16];
        _projectStage.textAlignment = NSTextAlignmentLeft;
        _projectStage.backgroundColor = [UIColor redColor];
    }
    return _projectStage;
}
@end
