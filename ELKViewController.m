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
@synthesize currentQuestion, questionStore, score, performanceViewController, backgroundImage, navBar, wrongPic;



- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [UIApplication sharedApplication].statusBarHidden = YES;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgnoise_lg.png"]];
    
    
    // Trying to set up a toolar button
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    [button setTitle:@"Hey!!" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonFavoriteClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *favorite = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = favorite;
    
    [self setScore:(0)];
    self.questionStore = [[ELKQuestionStore alloc] init];
    self.currentQuestion = [[self questionStore] getQuestion];
    [self showQuestion:self];
	    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)showAnswer:(id)sender
{
    UIImage *wrongPicture = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"leftArrow" ofType:@".png"]];
    UIImageView *wrongPic = [[UIImageView alloc] initWithImage:wrongPicture];
    
    if([sender tag] == [[self currentQuestion] correctAnswer]){
        NSLog(@"Got it right!");
        [[self currentQuestion] setSubmittedAnswer:true];
        [self.questionStore handleResponse:currentQuestion];
        [self incrementScore:self];
    } else {
        if([sender tag] == 0){
            [UIView transitionWithView:self.leftPhoto    
                              duration:1         
                               options:UIViewAnimationOptionTransitionFlipFromLeft
                            animations:^{self.leftPhoto = wrongPic;}
                            completion:NULL];
        }else{
            
            [UIView transitionWithView:self.leftPhoto
                              duration:1
                               options:UIViewAnimationOptionTransitionFlipFromLeft
                            animations:^{self.leftPhoto = wrongPic;}
                            completion:NULL];
            /*[self.coverRight performSelector:@selector(setHidden:)
                                 withObject:[NSNumber numberWithBool:YES]
                                 afterDelay:1.0];*/
      }
        ///////////// BUGGGGG
        // make sure that this stuff only happens AFTER the animation
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
    UIImage *leftPic = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:self.currentQuestion.leftPhoto.path ofType:@".jpg"]];
    UIImage *rightPic = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:self.currentQuestion.rightPhoto.path ofType:@".jpg"]];
   
    
    [[self leftPhoto] setImage:leftPic];
    [self.leftPhoto.layer setBorderWidth:3.5f];
    [self.leftPhoto.layer setBorderColor:[UIColor whiteColor].CGColor];
    CALayer *btnLayer = [self.leftPhoto layer];
    [btnLayer setMasksToBounds:YES];
    [btnLayer setCornerRadius:2.0f];
    
    //Shadow stuff
   /* btnLayer.shadowColor = [UIColor blackColor].CGColor;
    btnLayer.shadowOffset = CGSizeMake(0, -10);
    btnLayer.shadowOpacity = 1;
    btnLayer.shadowRadius = 10.0;*/

    
    [[self rightPhoto] setImage:rightPic];
    [self.rightPhoto.layer setBorderWidth:3.5f];
    [self.rightPhoto.layer setBorderColor:[UIColor whiteColor].CGColor];
    btnLayer = [self.rightPhoto layer];
    [btnLayer setMasksToBounds:YES];
    [btnLayer setCornerRadius:2.0f];
    
  ////// NAV BARE STUFFFFF
    // [[self navigationItem] setTitle:self.currentQuestion.questionText];
    NSLog(@"%@",[self navigationItem]);
    [[self navigationItem] setTitle:@"hola"];
    //NSLog(self.currentQuestion.questionText);

}

- (IBAction)incrementScore:(id)sender
{

    int newScore = [self score];
    [self setScore:(++newScore)];
    //[[self scoreLabel] setText:[NSString stringWithFormat:@"Score: %d", newScore]];
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
