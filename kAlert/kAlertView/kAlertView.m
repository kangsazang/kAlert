//
//  kAlertView.m
//  kAlert
//
//  Created by Chans  on 2016. 10. 28..
//  Copyright © 2016년 Chans. All rights reserved.
//

#import "kAlertView.h"

@interface kAlertView ()
@property (nonatomic, copy) kAlertButtonActionBlock actionBlock;
@end

@implementation kAlertView

+ (nullable instancetype)showWithTitle:(nullable NSString *)title
                               message:(nullable NSString *)message
                     cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                     otherButtonTitles:(nullable NSArray *)otherButtonTitles
                     buttonActionBlock:(nullable kAlertButtonActionBlock)buttonActionBlock
{
    
    kAlertView *alertView = [[self alloc] initWithTitle:title
                                                 message:message
                                                delegate:nil
                                       cancelButtonTitle:cancelButtonTitle
                                       otherButtonTitles:nil];
    alertView.delegate = alertView;
    for (NSString *otherButtonTitle in otherButtonTitles) {
        [alertView addButtonWithTitle:otherButtonTitle];
    }
    
    alertView.actionBlock = buttonActionBlock;
    
    return alertView;
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    if (self.actionBlock) {
        self.actionBlock(buttonTitle, buttonIndex);
    }
}

@end
