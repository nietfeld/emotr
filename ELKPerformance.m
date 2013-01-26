//
//  ELKPerformance.m
//  emotr
//
//  Created by Margaret Nietfeld on 1/23/13.
//  Copyright (c) 2013 Margaret Nietfeld. All rights reserved.
//

#import "ELKPerformance.h"

@implementation ELKPerformance
@synthesize performanceCounter;

-(void)incrementPerformance
{
    [self setPerformanceCounter:([self performanceCounter]+1)];
}

@end
