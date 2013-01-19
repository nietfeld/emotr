//
//  ELKQuestion.h
//  emotr
//
//  Created by Margaret Nietfeld on 1/19/13.
//  Copyright (c) 2013 Margaret Nietfeld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELKQuestion : NSObject


@property (nonatomic, strong) NSString *questionText;
@property (nonatomic, strong) NSString *leftPhoto;
@property (nonatomic, strong) NSString *rightPhoto;
@property (nonatomic) BOOL answer;
@end
