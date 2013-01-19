//
//  ELKQuestionStore.h
//  emotr
//
//  Created by Margaret Nietfeld on 1/19/13.
//  Copyright (c) 2013 Margaret Nietfeld. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ELKQuestion.h"

@interface ELKQuestionStore : NSObject
- (ELKQuestion *)getQuestion;
@end
