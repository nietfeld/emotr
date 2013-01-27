//
//  ELKPerformanceViewController.m
//  emotr
//
//  Created by Margaret Nietfeld on 1/26/13.
//  Copyright (c) 2013 Margaret Nietfeld. All rights reserved.
//

#import "ELKPerformanceViewController.h"

@interface ELKPerformanceViewController ()

@end

@implementation ELKPerformanceViewController
@synthesize performanceLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)hi
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showPerformance:(id)sender
{
    /*int i = 1;
    NSNumber *count = [[sender performanceDictionary] objectForKey:[NSNumber numberWithInt:i]];
    NSLog(@"count = %@", count);
    [performanceLabel setText:@"anteater"];*/
}

@end
