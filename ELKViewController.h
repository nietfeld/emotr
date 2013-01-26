//
//  ELKViewController.h/Users/margaretnietfeld/Dropbox/iOS apps/emotr/emotr/ELKViewController.m
//  emotr
//
//  Created by Margaret Nietfeld on 1/19/13.
//  Copyright (c) 2013 Margaret Nietfeld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ELKQuestionStore.h"
#import "ELKPerformanceViewController.h"

@interface ELKViewController : UIViewController{
    ELKPerformanceViewController *performanceViewController;
}
@property (nonatomic, retain) ELKPerformanceViewController *performanceViewController;
@property (weak, nonatomic) IBOutlet UIButton *switchViewButton;


@property (strong, nonatomic) ELKQuestion *currentQuestion;
@property (nonatomic, strong) ELKQuestionStore *questionStore;

@property (weak, nonatomic) IBOutlet UIButton *leftPhoto;
@property (weak, nonatomic) IBOutlet UILabel *leftPhotoLabel;
@property (weak, nonatomic) IBOutlet UIButton *rightPhoto;
@property (weak, nonatomic) IBOutlet UILabel *rightPhotoLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;

@property (weak, nonatomic) IBOutlet UILabel *coverLeft;
@property (weak, nonatomic) IBOutlet UILabel *coverRight;
@property (weak, nonatomic) IBOutlet UILabel *backgroundLabel;

@property (nonatomic) NSTimer* timer;
@property (nonatomic) int score;

- (IBAction)showAnswer:(id)sender;
- (IBAction)showQuestion:(id)sender;
- (IBAction)incrementScore:(id)sender;
- (IBAction)switchToPerformanceView:(id)sender;

@end
