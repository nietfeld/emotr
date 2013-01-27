//
//  ELKPerformanceViewController.h
//  emotr
//
//  Created by Margaret Nietfeld on 1/26/13.
//  Copyright (c) 2013 Margaret Nietfeld. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ELKPerformanceViewDelegate 
@end
@interface ELKPerformanceViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *performanceLabel;
@property (weak, nonatomic) IBOutlet UIToolbar *closeButton;

- (IBAction)showPerformance:(id)sender;
- (IBAction)hi;
@end
