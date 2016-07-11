//
//  LoginViewController.m
//  LwssonDB
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginRequest.h"
#import "RegIsterViewController.h"

@interface LoginViewController ()

@property (strong, nonatomic) IBOutlet UITextField *usernameTextfiled;

@property (strong, nonatomic) IBOutlet UITextField *passwordTextfiled;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}


//登录按钮
- (IBAction)loginAction:(UIButton *)sender {
    
    [self login];
  
}



- (void)login
{
    
    UIAlertController *uialert = [UIAlertController alertControllerWithTitle:@"!提示" message:@"您输入的有误,请确认后再输入" preferredStyle:(UIAlertControllerStyleAlert)];
    
    //验证,判断用户名密码
    if ([self.usernameTextfiled.text length] == 0) {

        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"用户名为空" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        }];
        [uialert addAction:action1];
        [self presentViewController:uialert animated:YES completion:nil];
        
        
    }else if ([self.passwordTextfiled.text length] == 0)
    {
     
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"密码为空" style:UIAlertActionStyleDefault handler: nil];
        [uialert addAction:action2];
        [self presentViewController:uialert animated:YES completion:nil];
        
        
    }else{
    LoginRequest *request = [[LoginRequest alloc] init];
    [request loginRequestWtihUsername:self.usernameTextfiled.text password:self.passwordTextfiled.text success:^(NSDictionary *dic) {
//        NSLog(@"%@",dic);
        NSString *code = [[dic objectForKey:@"code"] stringValue];
        if ([code isEqualToString:@"1103"]) {
            
            NSString *avatar = [[dic objectForKey:@"data"] objectForKey:@"avatar"];
            NSString *userId = [[dic objectForKey:@"data"] objectForKey:@"userId"];
            //保存头像和id到本地
            [[NSUserDefaults standardUserDefaults] setObject:avatar forKey:@"avatar"];
            [[NSUserDefaults standardUserDefaults] setObject:userId forKey:@"userId"];
            //立即保存
            [[NSUserDefaults standardUserDefaults]synchronize];
            [self dismissViewControllerAnimated:YES completion:^{
            }];
        }else if ([code isEqualToString:@"1101"]){
            
            
            UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"登录非法访问" style:UIAlertActionStyleDefault handler: nil];
            [uialert addAction:action3];
            [self presentViewController:uialert animated:YES completion:nil];
            
        }else if ([code isEqualToString:@"1102"]){
            
            UIAlertAction *action4 = [UIAlertAction actionWithTitle:@"登录用户不存在" style:UIAlertActionStyleDefault handler: nil];
            [uialert addAction:action4];
            [self presentViewController:uialert animated:YES completion:nil];
            
        }
    
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    }
}




//跳转注册页面
- (IBAction)registerBtnClicked:(UIButton *)sender {
    
    UIStoryboard *mainSb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    RegIsterViewController *registerVC = [mainSb instantiateViewControllerWithIdentifier:@"RegIsterViewController"];
    [self presentViewController:registerVC animated:YES completion:nil];
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
