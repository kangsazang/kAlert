//
//  kActionSheet.h
//  kAlert
//
//  Created by Chans  on 2016. 10. 28..
//  Copyright © 2016년 Chans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "kAlertDefination.h"

@interface kActionSheet : UIActionSheet

+ (nullable instancetype)showWithTitle:(nullable NSString *)title
                     cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                     otherButtonTitles:(nullable NSArray *)otherButtonTitles
                     buttonActionBlock:(nullable kAlertButtonActionBlock)buttonActionBlock;

@end
