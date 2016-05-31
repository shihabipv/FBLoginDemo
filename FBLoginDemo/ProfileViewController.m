//
//  ProfileViewController.m
//  FBLoginDemo
//
//  Created by Shihabul on 12/2/15.
//  Copyright © 2015 Shihabul. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController
@synthesize profileImage,emailField,nameField;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([FBSDKAccessToken currentAccessToken]) {
        
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"picture.type(large), email, name"}]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 
                 [self.emailField setText:[result objectForKey:@"email"]];
                 [self.nameField setText:[result objectForKey:@"name"]];
                 
                 NSString *imageStringOfLoginUser = [[[result valueForKey:@"picture"] valueForKey:@"data"] valueForKey:@"url"];
                 NSURL *url = [[NSURL alloc]initWithString:imageStringOfLoginUser];
                 NSData *pullFBPP = [[NSData alloc]initWithContentsOfURL:url];
                 UIImage *profImage = [UIImage imageWithData:pullFBPP];
                 [self.profileImage setImage:profImage];
                 
                 NSLog(@"Email: %@",[result objectForKey:@"email"]);
                 NSLog(@"Name : %@",[result objectForKey:@"name"]);
                 NSLog(@"Picture : %@",[result objectForKey:@"picture"]);
                 NSLog(@"imageStringOfLoginUser : %@",imageStringOfLoginUser);
             }
         }];
        FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                      initWithGraphPath:[[FBSDKAccessToken currentAccessToken] userID]
                                      parameters:@{@"fields": @"birthday, first_name, age_range"}
                                      HTTPMethod:@"GET"];
        [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                              id result,
                                              NSError *error) {
            NSLog(@"birthday : %@",[result objectForKey:@"birthday"]);
            NSLog(@"age_range : %@",[result objectForKey:@"age_range"]);
            NSLog(@"first_name : %@",[result objectForKey:@"first_name"]);
        }];
    }
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

- (IBAction)logout:(id)sender {
    [[FBSDKLoginManager new] logOut];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
