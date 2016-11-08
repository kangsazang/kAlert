//
//  kActionSheet.m
//  kAlert
//
//  Created by Chans  on 2016. 10. 28..
//  Copyright © 2016년 Chans. All rights reserved.
//

#import "kActionSheet.h"

@interface kActionSheet () <UIActionSheetDelegate>
@property (nonatomic, copy) kAlertButtonActionBlock actionBlock;
@end

@implementation kActionSheet

+ (nullable instancetype)showWithTitle:(nullable NSString *)title
                     cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                     otherButtonTitles:(nullable NSArray *)otherButtonTitles
                     buttonActionBlock:(nullable kAlertButtonActionBlock)buttonActionBlock
{
    kActionSheet *actionSheet = [[self alloc] initWithTitle:title
                                                    delegate:nil
                                           cancelButtonTitle:cancelButtonTitle
                                      destructiveButtonTitle:nil
                                           otherButtonTitles:nil];
    actionSheet.delegate = actionSheet;
    
    for (NSString *otherButtonTitle in otherButtonTitles) {
        [actionSheet addButtonWithTitle:otherButtonTitle];
    }
    
    actionSheet.actionBlock = buttonActionBlock;
    
    return actionSheet;
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    if (self.actionBlock) {
        self.actionBlock(buttonTitle, buttonIndex);
    }
}

@end
