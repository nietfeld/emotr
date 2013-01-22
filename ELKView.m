//
//  ELKView.m
//  emotr
//
//  Created by Margaret Nietfeld on 1/21/13.
//  Copyright (c) 2013 Margaret Nietfeld. All rights reserved.
//

#import "ELKView.h"

@implementation ELKView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{    
    
    CGRect myRect = CGRectMake(20,20,100,100);
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(c, 1.0, 1, 1, 1.0);
    CGContextFillRect(c, myRect);
}


@end
