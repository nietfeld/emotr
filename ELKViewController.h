//
//  ELKViewController.h
//  emotr
//
//  Created by Margaret Nietfeld on 1/19/13.
//  Copyright (c) 2013 Margaret Nietfeld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ELKQuestionStore.h"

@interface ELKViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *rightPhoto;
@property (weak, nonatomic) IBOutlet UIButton *leftPhoto;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;

//- (IBAction)choseLeftImage:(id)sender;
//- (IBAction)choseRightImage:(id)sender;
- (IBAction)makePopUp:(id)sender;
- (IBAction)showQuestion:(id)sender;
- (IBAction)incrementScore:(id)sender;

// should this be weak? 
@property (strong, nonatomic) ELKQuestion *currentQuestion;
@property (nonatomic) int score;
@property (nonatomic, strong) ELKQuestionStore *questionStore;
@end
