//
//  ELKQuestion.h
//  emotr
//
//  Created by Margaret Nietfeld on 1/19/13.
//  Copyright (c) 2013 Margaret Nietfeld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELKQuestion : NSObject
- (ELKQuestion *)getQuestion;

@property (nonatomic, copy) NSString *questionText; 
@property (nonatomic, copy) UIImage *leftPhoto;
@property (nonatomic, copy) UIImage *rightPhoto;
@property (nonatomic) BOOL answer;
@end
