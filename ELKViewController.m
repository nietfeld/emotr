//
//  ELKViewController.m
//  emotr
//
//  Created by Margaret Nietfeld on 1/19/13.
//  Copyright (c) 2013 Margaret Nietfeld. All rights reserved.
//

#import "ELKViewController.h"
#import "ELKQuestion.h"

@interface ELKViewController ()

@end

@implementation ELKViewController
@synthesize currentQuestion, questionStore, score;


- (void)viewDidLoad
{

    [super viewDidLoad];
    [self setScore:(0)];
    self.questionStore = [[ELKQuestionStore alloc] init];
    
    // Initializes with a new photo, stolen from dismissing the pop up. Factor this out? 
    self.currentQuestion = [self.questionStore getQuestion];
    [self showQuestion:self];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)makePopUp:(id)sender
{
    NSString *alertTitle;
    NSString *alertMessage;
    if([sender tag] == [[self currentQuestion] answer]){
        alertTitle = @"Congrats!!!";
        alertMessage = @"Great Job!";
        [self incrementScore:self];
    }else {
        alertTitle = @"Not Quite";
        alertMessage = @"Keep Trying!";
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:alertTitle
                                                    message:alertMessage
                                                   delegate:self
                                          cancelButtonTitle:@"Next"
                                          otherButtonTitles:nil];
    [alert show];
}
 
- (void)alertView:(UIAlertView *)alertV didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    self.currentQuestion = [self.questionStore getQuestion]; 
    [self showQuestion:self];
    
}

- (IBAction)showQuestion:(id)sender
{

    
    UIImage *leftPhoto = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:self.currentQuestion.leftPhoto ofType:@"jpg"]];
    UIImage *rightPhoto = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:self.currentQuestion.rightPhoto ofType:@"jpg"]];
    [[self leftPhoto] setImage:leftPhoto forState:UIControlStateNormal];
    [[self leftPhotoLabel] setText:[NSString stringWithFormat:@"%d", [currentQuestion leftPhotoEmotion]]];
    [[self rightPhoto] setImage:rightPhoto forState:UIControlStateNormal];
    [[self rightPhotoLabel] setText:[NSString stringWithFormat:@"%d", [currentQuestion rightPhotoEmotion]]];
    [[self questionLabel] setText:self.currentQuestion.questionText];
    NSLog(@"left photo %@, right photo %@", [currentQuestion leftPhoto], [currentQuestion rightPhoto]);
}

- (IBAction)incrementScore:(id)sender
{
    
    int newScore = [self score];
    [self setScore:(++newScore)];
    [[self scoreLabel] setText:[NSString stringWithFormat:@"Score: %d", newScore]];
}
@end
