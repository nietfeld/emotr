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
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)makePopUp:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"BOOYAH!"
                                                    message:@"Saved" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertV didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    // call the showQuestion for a new question and update the score
    self.currentQuestion = [self.questionStore getQuestion];
    [self showQuestion:self];
    [self incrementScore:self];
    
}

- (IBAction)showQuestion:(id)sender
{
    
    UIImage *nextPhoto = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:self.currentQuestion.leftPhoto ofType:@"jpeg"]];
    [[self leftPhoto] setImage:nextPhoto forState:UIControlStateNormal];
    [[self rightPhoto] setImage:nextPhoto forState:UIControlStateNormal];
    [[self questionLabel] setText:self.currentQuestion.questionText];
}

- (IBAction)incrementScore:(id)sender
{
    
    int newScore = [self score];
    [self setScore:(++newScore)];
    [[self scoreLabel] setText:[NSString stringWithFormat:@"%d", newScore]];
}
@end
