//
//  MyBuildingTabBarController.m
//  TEMP
//
//  Created by ShenjiGroup on 15/7/29.
//  Copyright (c) 2015年 ShenjiGroup. All rights reserved.
//

#import "MyBuildingTabBarController.h"



#define IMAGEEDGE(imageNameStr, top, bottom)  UIEdgeInsetsMake(top, (self.bgImageView.frame.size.width*0.25-(((49 - top -bottom)*[UIImage imageNamed:imageNameStr].size.width)/[UIImage imageNamed:imageNameStr].size.height))*0.5, bottom, (self.bgImageView.frame.size.width*0.25-(((49 - top -bottom)*[UIImage imageNamed:imageNameStr].size.width)/[UIImage imageNamed:imageNameStr].size.height))*0.5)

@interface MyBuildingTabBarController ()

/**
 *  选中的按钮(页面)
 */
@property (nonatomic,strong)UIButton *selectedBtn;

@end

@implementation MyBuildingTabBarController

/**
 *  底栏的单例方法
 *
 *  @return 返回底栏
 */
+(MyBuildingTabBarController *)sharedTabbarController
{
    static MyBuildingTabBarController *buildingTbc = nil;
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        buildingTbc = [[MyBuildingTabBarController alloc]init];
    });
    return buildingTbc;
}

- (void)viewDidLoad
{
    [super viewDidLoad];    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //删除Tabbar上系统自带的按钮
    [self.tabBar.subviews makeObjectsPerformSelector:@selector(removeFromSuperview) withObject:nil];
    //定制底栏
    [self customTabbar];
    //底栏上添加按钮
    //[self addButtons];
}

/**
 *  定制底栏
 */
- (void)customTabbar
{
    self.bgImageView = [[UIImageView alloc]initWithFrame:self.tabBar.bounds];
    self.bgImageView.userInteractionEnabled = YES;
    self.bgImageView.image = [UIImage imageNamed:@"bg"];
    [self.tabBar addSubview:self.bgImageView];
}


-(void)addBtnTitle:(NSArray *)titleStrArray andBtnImage:(NSArray *)imageStrArray BtnSelectedStr:(NSArray *)selectedImageStrArray
{
    for (int i = 0; i<4; i++)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(self.bgImageView.frame.size.width*0.25*i, 0, self.bgImageView.frame.size.width*0.25, self.bgImageView.frame.size.height)];
        btn.tag = 10+i;
        if (i == 0)
        {
            btn.selected = YES;
            self.selectedBtn = btn;
        }
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        //没有图片的情况
        if (imageStrArray == nil)
        {
            [btn setTitle:titleStrArray[i] forState:UIControlStateNormal];
            [btn setTitle:titleStrArray[i] forState:UIControlStateSelected];
        }
        else
        {
            [btn setImage:[UIImage imageNamed:imageStrArray[i]] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:selectedImageStrArray[i]] forState:UIControlStateSelected];
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 29, btn.bounds.size.width, 20)];
            label.text = titleStrArray[i];
            [btn addSubview:label];
        }
                
//        switch (i) {
//            case 0:
//                btn.selected = YES;
//                btn.imageEdgeInsets = IMAGEEDGE(@"主菜单01a", 0.0, 0.0);
//                self.selectedBtn = btn;
//                break;
//            case 1:
//                btn.imageEdgeInsets = IMAGEEDGE(@"主菜单02a", 0.0, 0.0);
//                self.selectedBtn = btn;
//                break;
//            case 2:
//                btn.imageEdgeInsets = IMAGEEDGE(@"主菜单03a", 0.0, 0.0);
//                self.selectedBtn = btn;
//                break;
//            case 3:
//                btn.imageEdgeInsets = IMAGEEDGE(@"主菜单04a", 0.0, 0.0);
//                self.selectedBtn = btn;
//                break;
//            default:
//                break;
//        }
        
        [self.bgImageView addSubview:btn];
    }

}
/**
 *  底栏上添加按钮
 */
- (void)addButtons
{
    for (int i = 0; i<4; i++)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(self.bgImageView.frame.size.width*0.25*i, 0, self.bgImageView.frame.size.width*0.25, self.bgImageView.frame.size.height)];
        btn.tag = 10+i;
        
        NSString *imageStr = [NSString stringWithFormat:@"主菜单0%da",i+1];
        NSString *imageSelectedStr = [NSString stringWithFormat:@"主菜单0%db",i+1];
        [btn setImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:imageSelectedStr] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i == 0)
        {
            btn.selected = YES;
            self.selectedBtn = btn;
        }
        switch (i) {
            case 0:
                btn.selected = YES;
                btn.imageEdgeInsets = IMAGEEDGE(@"主菜单01a", 0.0, 0.0);
                self.selectedBtn = btn;
                break;
            case 1:
                btn.imageEdgeInsets = IMAGEEDGE(@"主菜单02a", 0.0, 0.0);
                self.selectedBtn = btn;
                break;
            case 2:
                btn.imageEdgeInsets = IMAGEEDGE(@"主菜单03a", 0.0, 0.0);
                self.selectedBtn = btn;
                break;
            case 3:
                btn.imageEdgeInsets = IMAGEEDGE(@"主菜单04a", 0.0, 0.0);
                self.selectedBtn = btn;
                break;

                
            default:
                break;
        }
        
        [self.bgImageView addSubview:btn];
    }
    
    
    
}

/**
 *  按钮点击事件
 *
 *  @param btn 点击按钮
 */
- (void)btnClick:(UIButton *)btn
{
    if (btn != self.selectedBtn)
    {
        self.selectedBtn.selected = NO;
        btn.selected = YES;
        self.selectedBtn = btn;
        
        self.selectedIndex = btn.tag - 10;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
