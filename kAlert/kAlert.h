//
//  kAlert.h
//  kAlert
//
//  Created by Chans  on 2016. 10. 19..
//  Copyright © 2016년 Chans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "kAlertDefination.h"

@interface kAlert : NSObject

+ (void)showAlertWithTitle:(nullable NSString *)title
                   message:(nullable NSString *)message
         cancelButtonTitle:(nullable NSString *)cancelButtonTitle
         otherButtonTitles:(nullable NSArray *)otherButtonTitles
         buttonActionBlock:(nullable kAlertButtonActionBlock)buttonActionBlock;

+ (void)showActionSheetWithTitle:(nullable NSString *)title
               cancelButtonTitle:(nullable NSString *)cancelButtonTitle
               otherButtonTitles:(nullable NSArray *)otherButtonTitles
               buttonActionBlock:(nullable kAlertButtonActionBlock)buttonActionBlock;

@end
