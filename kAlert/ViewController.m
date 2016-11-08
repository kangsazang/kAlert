//
//  ViewController.m
//  kAlert
//
//  Created by Chans  on 2016. 10. 19..
//  Copyright © 2016년 Chans. All rights reserved.
//

#import "ViewController.h"
#import "kAlert.h"
@interface ViewController () <UIAlertViewDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)showAlertButtonPressed:(id)sender
{
    [kAlert showAlertWithTitle:@"title"
                        message:@"the Message"
              cancelButtonTitle:@"cancel"
              otherButtonTitles:@[@"ok",@"delete"]
              buttonActionBlock:^(NSString *buttonTitle, NSInteger tag) {
                  NSLog(@"Alert ^ %zd %@",tag,buttonTitle);
              }];
}

- (IBAction)showActionSheetPressed:(id)sender
{
    [kAlert showActionSheetWithTitle:@"title"
                    cancelButtonTitle:@"cancel"
                    otherButtonTitles:@[@"ok",@"delete"]
                    buttonActionBlock:^(NSString *buttonTitle, NSInteger tag) {
                        NSLog(@"ActionSheet ^ %zd %@",tag,buttonTitle);
                    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.    
}



@end
