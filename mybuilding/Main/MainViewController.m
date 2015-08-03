//
//  MainViewController.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "MainViewController.h"
#import "LoginApi.h"
#import "MD5.h"
#import "LoginModel.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:19], NSFontAttributeName,nil]];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"wy0001" forKey:@"userNameOrCellPhone"];
    [dic setValue:[MD5 md5HexDigest:@"111111"] forKey:@"password"];
    [dic setValue:@"05" forKey:@"deviceType"];
    [dic setValue:@"" forKey:@"token"];
    [dic setValue:@"02" forKey:@"downloadType"];
    [LoginApi LoginWithBlock:^(LoginModel *loginModel, NSError *error) {
        if(!error){
            NSLog(@"%@",loginModel.a_userAvatarUrl);
            UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
            [image sd_setImageWithURL:loginModel.a_userAvatarUrl placeholderImage:[GetImagePath getImagePath:@"loading"]];
            [self.view addSubview:image];
        }
    } dic:dic noNetWork:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
