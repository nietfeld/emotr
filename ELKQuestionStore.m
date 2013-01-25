//
//  ELKQuestionStore.m
//  emotr
//
//  Created by Margaret Nietfeld on 1/19/13.
//  Copyright (c) 2013 Margaret Nietfeld. All rights reserved.
//

#import "ELKQuestionStore.h"
#import <sqlite3.h>

@implementation ELKQuestionStore
@synthesize prior, threshold, step, history, lastQuestionCorrect;

- (void)handleResponse:(ELKQuestion*)answeredQuestion {
    
    // FIX THIS 
    if(lastQuestionCorrect && [answeredQuestion submittedAnswer]){
        [self setLastQuestionCorrect:false];
        //while (threshold > 0)
            [self setThreshold:([self threshold] - [self step])];
        NSLog(@"Last question was right!");
    }else if(lastQuestionCorrect && ![answeredQuestion submittedAnswer]){
        lastQuestionCorrect = false;
        NSLog(@"Last question was right!");
    }else if(!lastQuestionCorrect && [answeredQuestion submittedAnswer]){
        lastQuestionCorrect = true;
        NSLog(@"Last question was right!");
    }else if(! lastQuestionCorrect && [answeredQuestion submittedAnswer]){
        //while(threshold < 50)
        [self setThreshold:([self threshold] + [self step])];
        NSLog(@"Last two questions were wrong!");
    }
    // add recording to a dictionary here later
    
}

- (ELKQuestion *)getQuestion
{
    
    ELKQuestion *newQuestion = [[ELKQuestion alloc] init];
    
    
    sqlite3_stmt *results;
    int err = sqlite3_prepare(database, "SELECT * FROM photos AS `photos1` JOIN photos AS `photos2` ON `photos2`.intensity = (`photos1`.intensity + ?) OR `photos2`.intensity = (`photos1`.intensity - ?) WHERE `photos1`.emotions_people_id = (SELECT (ABS(RANDOM()) % (SELECT COUNT() FROM emotions_people) + 1)) AND `photos2`.emotions_people_id = `photos1`.emotions_people_id ORDER BY RANDOM() LIMIT 2", 1000, &results, NULL);
    
    // requesting the photos based on the threshold level 
    if (err != SQLITE_OK){
        NSLog(@"Database error %d!!", err);
    }else{
        sqlite3_bind_int(results, 1, [self threshold]);
        sqlite3_bind_int(results, 2, [self threshold]);
    }
    
    sqlite3_step(results);
    const unsigned char *picture_name = sqlite3_column_text(results, 0);
    int intensity = sqlite3_column_int(results, 2);
    [[newQuestion leftPhoto] setPath:[NSString stringWithFormat:@"%s", picture_name]];
    [[newQuestion leftPhoto] setIntensity:intensity];
    
    picture_name = sqlite3_column_text(results, 3);
    intensity = sqlite3_column_int(results, 5);
    [[newQuestion rightPhoto] setPath:[NSString stringWithFormat:@"%s", picture_name]];
    [[newQuestion rightPhoto] setIntensity:intensity];
    
    
    [newQuestion setQuestionText:@"Which face is happier?"];
    
    sqlite3_finalize(results);
    
    // Asign answer
    newQuestion.correctAnswer = [[newQuestion leftPhoto] intensity] >= [[newQuestion rightPhoto] intensity]?LEFT:RIGHT;
    return newQuestion;
}

- (ELKQuestionStore *)init
{
    self = [super init];
    int openerror = sqlite3_open([[[NSBundle mainBundle] pathForResource:@"emotrDatabase" ofType:@"sqlite"] cStringUsingEncoding:NSASCIIStringEncoding], &database);
    
    if(openerror != SQLITE_OK)
        NSLog(@"Error Opening Database");
    
    // HOW TO INITIALIZE THIS? DO I HAVE TO???
    [self setHistory:[[NSMutableDictionary alloc] initWithCapacity:1000]];
    [self setStep:10];
    [self setThreshold:20];
    [self setPrior:20];
    return self;
}

@end
