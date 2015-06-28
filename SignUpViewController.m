//
//  SignUpViewController.m
//  NARAIGOTO
//
//  Created by 山本文子 on 2015/06/27.
//  Copyright (c) 2015年 山本文子. All rights reserved.
//

#import "SignUpViewController.h"
#import "ViewController.h"


@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    userNameTf.placeholder = @"user name";
    userNameTf.keyboardType = UIKeyboardTypeASCIICapable;
    userNameTf.returnKeyType = UIReturnKeyNext;
    passWordTf.placeholder = @"pass word";
    passWordTf.keyboardType = UIKeyboardTypeASCIICapable;
    passWordTf.returnKeyType = UIReturnKeyDone;
    [passWordTf setSecureTextEntry:YES];
}

// キーボードのReturnボタンがタップされたらキーボードを閉じるようにするUITextFiledの以下デリゲートメソッドを実装する
-(BOOL)textFieldShouldReturn:(UITextField*)textField{
    [userNameTf resignFirstResponder];
    [passWordTf resignFirstResponder];
    //    [eMailTf resignFirstResponder];
    return YES;
}

-(IBAction)signUp{
    PFUser *user  = [PFUser user];
    user.username = userNameTf.text;
    user.password = passWordTf.text;
    //    user.email    = eMailTf.text; //optional
    /*
     //上記以外に自身で以下のように追加することも可能
     user[@"phone"] = @"650-555-0000";
     */
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            //ユーザの作成に成功
            //storyBoardでビューコン同士をつないでセグウェイにIDをつけてからそれを指定して遷移する
            [self performSegueWithIdentifier:@"toViewController" sender:nil];
        } else {
            NSString *errorString = [error userInfo][@"error"];
            NSLog(@"errorString is ...%@",errorString);
            //アプリの作成に失敗
            //エラー内容を見れば理由がだいたい分かる。
        }
    }];
}

-(IBAction)signIn{
    [PFUser logInWithUsernameInBackground:userNameTf.text password:passWordTf.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            //ユーザのログインに成功
                                            [self performSegueWithIdentifier:@"toViewController" sender:nil];
                                        } else {
                                            //ユーザのログインに失敗
                                            NSString *errorString = [error userInfo][@"error"];
                                            NSLog(@"errorString is ...%@",errorString);
                                        }
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
