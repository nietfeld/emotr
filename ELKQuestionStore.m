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
@synthesize prior, threshold, step, performanceDictionary, lastQuestionCorrect;

- (void)handleResponse:(ELKQuestion*)answeredQuestion {
    
    // FIX THIS 
    if(lastQuestionCorrect && [answeredQuestion submittedAnswer]){
        if ([self threshold] > 0){
            [self setLastQuestionCorrect:false];
            [self setThreshold:([self threshold] - [self step])];
        }
        NSLog(@"Last question was right!");
    }else if(lastQuestionCorrect && ![answeredQuestion submittedAnswer]){
        lastQuestionCorrect = false;
        NSLog(@"Last question was right!");
    }else if(!lastQuestionCorrect && [answeredQuestion submittedAnswer]){
        lastQuestionCorrect = true;
        NSLog(@"Last question was right!");
    }else if(! lastQuestionCorrect && ![answeredQuestion submittedAnswer]){
        if ([self threshold] <= (51 - [self step])) {
            [self setThreshold:([self threshold] + [self step])];
        }
        NSLog(@"Last two questions were wrong!");
    }
    
    int emotionsKey = [[answeredQuestion leftPhoto] emotions_people];
    NSLog(@"%d", emotionsKey);
    
   // NSNumber *primaryKey = [NSNumber numberWithInt:emotionsKey];
   // NSLog(@"%@", primaryKey);
    ELKPerformance *p_lookup = [performanceDictionary objectForKey:[NSNumber numberWithInt:emotionsKey]]; 
    if(p_lookup == nil){
        NSLog(@"Nothing in dictionary with key %d", emotionsKey);
        p_lookup = [[ELKPerformance alloc] init];
        [performanceDictionary setObject:p_lookup forKey:([NSNumber numberWithInt:emotionsKey])];
    }
    [p_lookup incrementPerformance];
    NSLog(@"now the counter is: %d", [p_lookup performanceCounter]);
    
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
    int emotions_people = sqlite3_column_int(results, 1);
    int intensity = sqlite3_column_int(results, 2);
    [[newQuestion leftPhoto] setPath:[NSString stringWithFormat:@"%s", picture_name]];
    [[newQuestion leftPhoto] setEmotions_people:emotions_people];
    [[newQuestion leftPhoto] setIntensity:intensity];
    
    picture_name = sqlite3_column_text(results, 3);
    emotions_people = sqlite3_column_int(results, 4);
    intensity = sqlite3_column_int(results, 5);
    [[newQuestion rightPhoto] setPath:[NSString stringWithFormat:@"%s", picture_name]];
    [[newQuestion leftPhoto] setEmotions_people:emotions_people];
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
    [self setPerformanceDictionary:[[NSMutableDictionary alloc] initWithCapacity:50]];
    [self setStep:10];
    [self setThreshold:20];
    [self setPrior:20];
    return self;
}

@end
