//
//  kAlert.m
//  kAlert
//
//  Created by Chans  on 2016. 10. 19..
//  Copyright © 2016년 Chans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "kAlert.h"
#import "kAlertView.h"
#import "kActionSheet.h"


@interface kAlert()

@end

@implementation kAlert

+ (void)showAlertWithTitle:(nullable NSString *)title
                   message:(nullable NSString *)message
         cancelButtonTitle:(nullable NSString *)cancelButtonTitle
         otherButtonTitles:(nullable NSArray *)otherButtonTitles
         buttonActionBlock:(nullable kAlertButtonActionBlock)buttonActionBlock
{    
    if ([UIAlertController class]) {
        
        
        
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                                 message:message
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        
        
        
        
        
        
        
        
        if (cancelButtonTitle && cancelButtonTitle.length > 0) {
            [alertController addAction:[UIAlertAction actionWithTitle:cancelButtonTitle
                                                                style:UIAlertActionStyleCancel
                                                              handler:^(UIAlertAction * _Nonnull action) {
                                                                  buttonActionBlock(cancelButtonTitle,0);
                                                              }]];
        }
        
        for (int i = 1; i <= otherButtonTitles.count; i++) {
            NSString *buttonTitle = [otherButtonTitles objectAtIndex:i-1];
            [alertController addAction:[UIAlertAction actionWithTitle:buttonTitle
                                                                style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * _Nonnull action) {
                                                                  buttonActionBlock(buttonTitle,i);
                                                              }]];
        }
        
        
        [[self topViewController] presentViewController:alertController
                                               animated:YES
                                             completion:^{
                                                 
                                             }];
    }
    else
    {
        kAlertView *alert = [kAlertView showWithTitle:title
                                              message:message
                                    cancelButtonTitle:cancelButtonTitle
                                    otherButtonTitles:otherButtonTitles
                                    buttonActionBlock:buttonActionBlock];
        
        [alert show];
    }
}

+ (void)showActionSheetWithTitle:(nullable NSString *)title
               cancelButtonTitle:(nullable NSString *)cancelButtonTitle
               otherButtonTitles:(nullable NSArray *)otherButtonTitles
               buttonActionBlock:(nullable kAlertButtonActionBlock)buttonActionBlock
{
    if (![UIAlertController class]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                                 message:nil
                                                                          preferredStyle:UIAlertControllerStyleActionSheet];
        
        if (cancelButtonTitle && cancelButtonTitle.length > 0) {
            [alertController addAction:[UIAlertAction actionWithTitle:cancelButtonTitle
                                                                style:UIAlertActionStyleCancel
                                                              handler:^(UIAlertAction * _Nonnull action) {
                                                                  buttonActionBlock(cancelButtonTitle,0);
                                                              }]];
        }

        for (int i = 1; i <= otherButtonTitles.count; i++) {
            NSString *buttonTitle = [otherButtonTitles objectAtIndex:i-1];
            [alertController addAction:[UIAlertAction actionWithTitle:buttonTitle
                                                                style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * _Nonnull action) {
                                                                  buttonActionBlock(buttonTitle,i);
                                                              }]];
        }
        
        
        [[self topViewController] presentViewController:alertController
                                               animated:YES
                                             completion:^{
                                                 
                                             }];

    }
    else
    {
        UIActionSheet *actionSheet = [kActionSheet showWithTitle:title
                                                cancelButtonTitle:cancelButtonTitle
                                                otherButtonTitles:otherButtonTitles
                                                buttonActionBlock:buttonActionBlock];
        
        UIViewController *topViewController = [self topViewController];
        if ([topViewController isKindOfClass:[UITabBarController class]]) {
            UITabBarController *tabBarController = (UITabBarController *)topViewController;
            [actionSheet showFromTabBar:tabBarController.tabBar];
        }
        else
        {
            [actionSheet showInView:topViewController.view];
        }
        
    }
}

+ (UIViewController *)topViewController {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if (window == nil) { // window가 nil인경우도 있을 수 있다.
        window = [[UIApplication sharedApplication].delegate window];
    }
    UIViewController *rootViewController = window.rootViewController;
    
    return [self topViewControllerWithRootViewController:rootViewController];;
}

+ (UIViewController *)topViewControllerWithRootViewController:(UIViewController *)rootViewController {
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    }
    else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController;
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
    }
    else if ([rootViewController isKindOfClass:[UISplitViewController class]]) {
        UISplitViewController *splitViewController = (UISplitViewController *)rootViewController;
        return [self topViewControllerWithRootViewController:splitViewController.viewControllers[1]];
    }
    else if (rootViewController.presentedViewController) {
        UIViewController *presentedViewController = rootViewController.presentedViewController;
        if ([presentedViewController isKindOfClass:[UIAlertController class]]) {
            return rootViewController;
        }
        else {
            return [self topViewControllerWithRootViewController:presentedViewController];
        }
    }
    else {
        return rootViewController;
    }
}

@end





