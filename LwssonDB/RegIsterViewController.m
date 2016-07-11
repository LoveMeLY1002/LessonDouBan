//
//  RegIsterViewController.m
//  LwssonDB
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "RegIsterViewController.h"
#import "RegisterRequest.h"

@interface RegIsterViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITextField *usernameTextfiled;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextfiled;



@end

@implementation RegIsterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    self.imageView.userInteractionEnabled = YES;
    
    
    UITapGestureRecognizer *dianji = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(action:)];
    
    [self.imageView addGestureRecognizer:dianji];
    
    
}


//点击调用系统相册
- (void)action:(UITapGestureRecognizer *)sender
{
        UIImagePickerController *imagePC = [UIImagePickerController new];
    
        imagePC.delegate = self;
    
        imagePC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
        [self presentViewController:imagePC animated:YES completion:nil];
}




- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    
    UIImage *temp = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    self.imageView.image = temp;
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}







- (IBAction)registerAction:(UIButton *)sender {
    
    UIAlertController *uialert = [UIAlertController alertControllerWithTitle:@"!提示" message:@"您输入的有误,请确认后再输入" preferredStyle:(UIAlertControllerStyleAlert)];
    
    if([self.usernameTextfiled.text length] == 0) {
        
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"用户名为空" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        }];
        
        NSLog(@"用户名为空");
        
        [uialert addAction:action1];
        [self presentViewController:uialert animated:YES completion:nil];
        
        
    }else if ([self.passwordTextfiled.text length] == 0)
    {
        NSLog(@"密码为空");
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"密码为空" style:UIAlertActionStyleDefault handler: nil];
        [uialert addAction:action2];
        [self presentViewController:uialert animated:YES completion:nil];
    }else{
    
    RegisterRequest *request = [[RegisterRequest alloc]init];
    [request registerWithName:self.usernameTextfiled.text password:self.passwordTextfiled.text avator:self.imageView.image success:^(NSDictionary *dic) {
        
//        NSLog(@"register success = %@", dic);
        
        NSString *code = [[dic objectForKey:@"code"] stringValue];
        if ([code isEqualToString:@"1005"]) {
            NSString *avatar = [[dic objectForKey:@"data"] objectForKey:@"avatar"];
            NSString *userId = [[dic objectForKey:@"data"] objectForKey:@"userId"];
            //保存头像和id到本地
            [[NSUserDefaults standardUserDefaults] setObject:avatar forKey:@"avatar"];
            [[NSUserDefaults standardUserDefaults] setObject:userId forKey:@"userId"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            //界面消失
            [self dismissViewControllerAnimated:YES completion:^{
                
            }];
        }
        
        
    } failure:^(NSError *error) {
        
//         NSLog(@"register failure = %@", error);
    }];
  }
}







- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.usernameTextfiled resignFirstResponder];
    [self.passwordTextfiled resignFirstResponder];
    
//    [self dismissViewControllerAnimated:YES completion:nil];
    
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
