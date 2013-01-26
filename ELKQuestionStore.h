//
//  ELKQuestionStore.h
//  emotr
//
//  Created by Margaret Nietfeld on 1/19/13.
//  Copyright (c) 2013 Margaret Nietfeld. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ELKQuestion.h"
#import "ELKPerformance.h"
#import <sqlite3.h>

sqlite3 *database;

@interface ELKQuestionStore : NSObject
@property (nonatomic) int prior;
@property (nonatomic) int threshold;
@property (nonatomic) int step;
@property (nonatomic) bool lastQuestionCorrect;
@property (nonatomic) NSMutableDictionary *performanceDictionary;

- (ELKQuestion *)getQuestion;
- (void)handleResponse:(ELKQuestion*)question;

@end
