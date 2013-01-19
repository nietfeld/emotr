//
//  ELKQuestion.m
//  emotr
//
//  Created by Margaret Nietfeld on 1/19/13.
//  Copyright (c) 2013 Margaret Nietfeld. All rights reserved.
//

#import "ELKQuestion.h"

@implementation ELKQuestion
@synthesize questionText, leftPhoto, rightPhoto, answer;

- (ELKQuestion *)getQuestion
{
    ELKQuestion *newQuestion = [[ELKQuestion alloc] init];
    [self setQuestionText:@"Which elk is happier?"];
    UIImage *firstPhoto = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"deer1" ofType:@"jpeg"]];
    [self setLeftPhoto:firstPhoto];
    UIImage *secondPhoto = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"deer2" ofType:@"jpeg"]];
    [self setRightPhoto:secondPhoto];
    [self setAnswer:1];
    
    return newQuestion;
}

@end
