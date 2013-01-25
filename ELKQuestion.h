//
//  ELKQuestion.h
//  emotr
//
//  Created by Margaret Nietfeld on 1/19/13.
//  Copyright (c) 2013 Margaret Nietfeld. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "ELKPhoto.h"
#define LEFT 0
#define RIGHT 1

@interface ELKQuestion : NSObject

// Should these be strong? 
@property (nonatomic, strong) ELKPhoto *leftPhoto;
@property (nonatomic, strong) ELKPhoto *rightPhoto;
@property (nonatomic, strong) NSString *questionText;
@property (nonatomic) bool correctAnswer;
@property (nonatomic) bool submittedAnswer;
@end
