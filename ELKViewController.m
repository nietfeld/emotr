//
//  ELKViewController.m
//  emotr
//
//  Created by Margaret Nietfeld on 1/19/13.
//  Copyright (c) 2013 Margaret Nietfeld. All rights reserved.
//

#import "ELKViewController.h"
#import "ELKQuestion.h"
#import "ELKPerformanceViewController.h"

@interface ELKViewController ()
@end

@implementation ELKViewController
@synthesize currentQuestion, questionStore, score, performanceViewController;



- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [UIApplication sharedApplication].statusBarHidden = YES;
    [self setScore:(0)];
    self.questionStore = [[ELKQuestionStore alloc] init];
    self.currentQuestion = [[self questionStore] getQuestion];
    [self showQuestion:self];
	
    self.backgroundLabel.hidden = self.coverLeft.hidden = self.coverRight.hidden = YES;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)showAnswer:(id)sender
{
   
    
    if([sender tag] == [[self currentQuestion] correctAnswer]){
        NSLog(@"Got it right!");
        [[self currentQuestion] setSubmittedAnswer:true];
        [self.questionStore handleResponse:currentQuestion];
        [self incrementScore:self];
    } else {
        self.backgroundLabel.hidden = NO;
        if([sender tag] == 0){
            self.coverLeft.hidden = NO;
            [self.coverLeft performSelector:@selector(setHidden:)
                                 withObject:[NSNumber numberWithBool:YES]
                                 afterDelay:1.0];
        }else{
            self.coverRight.hidden = NO;
            [self.coverRight performSelector:@selector(setHidden:)
                                 withObject:[NSNumber numberWithBool:YES]
                                 afterDelay:1.0];
        }
        [self.backgroundLabel performSelector:@selector(setHidden:)
                              withObject:[NSNumber numberWithBool:YES]
                              afterDelay:1.0];
        [[self currentQuestion] setSubmittedAnswer:false];
        [self.questionStore handleResponse:currentQuestion];

    }
    
    // Function a bunch of stuff out into what to do while waiting and what to trigger after 
    
    self.currentQuestion = [self.questionStore getQuestion];
    [self showQuestion:self];
    
}


- (IBAction)showQuestion:(id)sender
{
    // DISPLAY THE PHOTOS! 
    UIImage *leftPhoto = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:self.currentQuestion.leftPhoto.path ofType:@".jpg"]];
    UIImage *rightPhoto = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:self.currentQuestion.rightPhoto.path ofType:@".jpg"]];

    [[self leftPhoto] setImage:leftPhoto forState:UIControlStateNormal];
    [[self leftPhotoLabel] setText:[NSString stringWithFormat:@"%d", [[currentQuestion leftPhoto] intensity]]];
    [[self rightPhoto] setImage:rightPhoto forState:UIControlStateNormal];
    [[self rightPhotoLabel] setText:[NSString stringWithFormat:@"%d", [[currentQuestion rightPhoto] intensity]]];
    [[self questionLabel] setText:self.currentQuestion.questionText];
    NSLog(@"left photo %@, right photo %@", [currentQuestion leftPhoto], [currentQuestion rightPhoto]);
}

- (IBAction)incrementScore:(id)sender
{

    int newScore = [self score];
    [self setScore:(++newScore)];
    [[self scoreLabel] setText:[NSString stringWithFormat:@"Score: %d", newScore]];
}

- (IBAction)switchToPerformanceView:(id)sender
{
    if (performanceViewController == nil)
    {
        ELKPerformanceViewController *newPerf = [[ELKPerformanceViewController alloc] initWithNibName:@"ELKPerformanceViewController"
                                                                                                                 bundle:[NSBundle mainBundle]];
        self.performanceViewController = newPerf;
        NSLog(@"Calling the performance view thing!!! ");
    }
    
    // How you reference your navigation controller will
    // probably be a little different
    [self presentViewController:performanceViewController animated: TRUE completion: nil];
}

@end
