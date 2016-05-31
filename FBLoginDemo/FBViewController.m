//
//  ViewController.m
//  FBLoginDemo
//
//  Created by Shihabul on 11/21/15.
//  Copyright © 2015 Shihabul. All rights reserved.
//

#import "FBViewController.h"

@interface FBViewController ()

@end

@implementation FBViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Add a custom login button to your app
    if ([FBSDKAccessToken currentAccessToken]) {
//        
//        UIButton *myLogoutButton=[UIButton buttonWithType:UIButtonTypeCustom];
//        myLogoutButton.backgroundColor=[UIColor brownColor];
//        myLogoutButton.frame=CGRectMake(0,0,180,40);
//        myLogoutButton.center = self.view.center;
//        [myLogoutButton setTitle: @"Logout" forState: UIControlStateNormal];
//        
//        [myLogoutButton
//         addTarget:self
//         action:@selector(logoutButtonClicked) forControlEvents:UIControlEventTouchUpInside];
//
//        [self.view addSubview:myLogoutButton];
        
          [self performSegueWithIdentifier:@"ProfileView" sender:self];

    }
    else{
        UIButton *myLoginButton=[UIButton buttonWithType:UIButtonTypeCustom];
        myLoginButton.backgroundColor=[UIColor darkGrayColor];
        myLoginButton.frame=CGRectMake(0,0,180,40);
        myLoginButton.center = self.view.center;
        [myLoginButton setTitle: @"My Login Button" forState: UIControlStateNormal];
        
        // Handle clicks on the button
        [myLoginButton
         addTarget:self
         action:@selector(loginButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        
        // Add the button to the view
        NSLog(@"Token: %@",[[FBSDKAccessToken currentAccessToken] tokenString]);
        NSLog(@"Permissions: %@",[[FBSDKAccessToken currentAccessToken] permissions]);
        NSLog(@"User ID: %@",[[FBSDKAccessToken currentAccessToken] userID]);
        NSLog(@"App ID: %@",[[FBSDKAccessToken currentAccessToken] appID]);

        [self.view addSubview:myLoginButton];
    }
    
}

-(void)loginButtonClicked
{
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    login.loginBehavior = FBSDKLoginBehaviorBrowser;
    [FBSDKProfile enableUpdatesOnAccessTokenChange:YES];
    [login
     logInWithReadPermissions: @[@"public_profile",@"email",@"user_friends"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSLog(@"Logged in");
             NSLog(@"currentProfile: %@",[FBSDKProfile currentProfile]);

             [self performSegueWithIdentifier:@"ProfileView" sender:self];
        }
     }];
}

-(void)logoutButtonClicked
{
    [[FBSDKLoginManager new] logOut];
    [self viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
