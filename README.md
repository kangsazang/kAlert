# kAlert

Simple Alert written in Objective-C  
This Alert is UIAlertController or UIAlertView + UIActionSheet
It supports from iOS6! 

# use

// Alert 
[kAlert showAlertWithTitle:@"title" message:@"the Message" cancelButtonTitle:@"cancel" otherButtonTitles:@[@"ok",@"delete"] buttonActionBlock:^(NSString *buttonTitle, NSInteger tag) { NSLog(@"Alert ^ %zd %@",tag,buttonTitle); }];

// ActionSheet
[kAlert showActionSheetWithTitle:@"title" cancelButtonTitle:@"cancel" otherButtonTitles:@[@"ok",@"delete"] buttonActionBlock:^(NSString *buttonTitle, NSInteger tag) { NSLog(@"ActionSheet ^ %zd %@",tag,buttonTitle); }];
