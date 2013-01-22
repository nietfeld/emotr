//
//  ELKQuestion.h
//  emotr
//
//  Created by Margaret Nietfeld on 1/19/13.
//  Copyright (c) 2013 Margaret Nietfeld. All rights reserved.
//

#import <Foundation/Foundation.h>
#define LEFT 0
#define RIGHT 1

@interface ELKQuestion : NSObject


@property (nonatomic, strong) NSString *questionText;
@property (nonatomic, strong) NSString *leftPhoto;
@property (nonatomic) int leftPhotoEmotion;
@property (nonatomic, strong) NSString *rightPhoto;
@property (nonatomic) int rightPhotoEmotion;
@property (nonatomic) int emotionDifference;
@property (nonatomic) int answer;
@end
