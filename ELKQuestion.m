//
//  ELKQuestion.m
//  emotr
//
//  Created by Margaret Nietfeld on 1/19/13.
//  Copyright (c) 2013 Margaret Nietfeld. All rights reserved.
//

#import "ELKQuestion.h"

@implementation ELKQuestion
@synthesize leftPhoto, rightPhoto, questionText, answer;

- (ELKQuestion *)init{
    self = [super init];
    leftPhoto = [[ELKPhoto alloc] init];
    rightPhoto = [[ELKPhoto alloc] init];
    return self;
}

@end