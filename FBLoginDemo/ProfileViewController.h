//
//  ProfileViewController.h
//  FBLoginDemo
//
//  Created by Shihabul on 12/2/15.
//  Copyright © 2015 Shihabul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
@interface ProfileViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *emailField;
@property (weak, nonatomic) IBOutlet UILabel *nameField;
- (IBAction)logout:(id)sender;

@end
