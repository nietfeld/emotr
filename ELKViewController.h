//
//  ELKViewController.h/Users/margaretnietfeld/Dropbox/iOS apps/emotr/emotr/ELKViewController.m
//  emotr
//
//  Created by Margaret Nietfeld on 1/19/13.
//  Copyright (c) 2013 Margaret Nietfeld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ELKQuestionStore.h"
#import "ELKPerformanceViewController.h"

@interface ELKViewController : UIViewController{
    ELKPerformanceViewController *performanceViewController;
}
@property (nonatomic, retain) ELKPerformanceViewController *performanceViewController;
@property (weak, nonatomic) IBOutlet UIButton *switchViewButton;
@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;

@property (strong, nonatomic) ELKQuestion *currentQuestion;
@property (nonatomic, strong) ELKQuestionStore *questionStore;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIImageView *leftPhoto;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet UIImageView *rightPhoto;

@property (weak, nonatomic) IBOutlet UIImageView *wrongPic;


@property (nonatomic) NSTimer* timer;
@property (nonatomic) int score;

- (IBAction)showAnswer:(id)sender;
- (IBAction)showQuestion:(id)sender;
- (IBAction)incrementScore:(id)sender;
- (IBAction)switchToPerformanceView:(id)sender;

@end
