//
//  SignUpViewController.h
//  NARAIGOTO
//
//  Created by 山本文子 on 2015/06/27.
//  Copyright (c) 2015年 山本文子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface SignUpViewController : UIViewController<UITextFieldDelegate>{
    IBOutlet UITextField *userNameTf;
    IBOutlet UITextField *passWordTf;
    //    IBOutlet UITextField *eMailTf;
}

- (IBAction)signUp;
- (IBAction)signIn;


@end
