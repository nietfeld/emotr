//
//  ELKPerformance.h
//  emotr
//
//  Created by Margaret Nietfeld on 1/23/13.
//  Copyright (c) 2013 Margaret Nietfeld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELKPerformance : NSObject
@property (nonatomic) int performanceCounter;

-(void)incrementPerformance;
@end
