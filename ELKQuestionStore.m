//
//  ELKQuestionStore.m
//  emotr
//
//  Created by Margaret Nietfeld on 1/19/13.
//  Copyright (c) 2013 Margaret Nietfeld. All rights reserved.
//

#import "ELKQuestionStore.h"

@implementation ELKQuestionStore

- (ELKQuestion *)getQuestion
{
    ELKQuestion *newQuestion = [[ELKQuestion alloc] init];
    [newQuestion setQuestionText:@"Which elk is happier?"];
    [newQuestion setLeftPhoto:@"deer1"];
    [newQuestion setRightPhoto:@"deer2"];
    [newQuestion setAnswer:1];
    
    return newQuestion;
}


@end
