//
//  InstagramController.h
//  Instagram_Login
//
//  Created by Rahul Singha Roy on 04/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConstantHandle.h"

@interface InstagramController : UIViewController


- (void)loginWithInstagramWithParsentViewController:(UIViewController *)controller  completionHandler:(void(^)(NSDictionary *userProfileInformation))completionHanlder failureHandler:(void(^)(NSDictionary *errorDetail))failureHandler;

- (void)sharePhotoWithInstagaramWithImage:(UIImage *)image parsentViewcontroller:(UIViewController *)controller;;

@end
