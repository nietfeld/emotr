//
//  ELKViewController.h
//  emotr
//
//  Created by Margaret Nietfeld on 1/19/13.
//  Copyright (c) 2013 Margaret Nietfeld. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ELKViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *rightPhoto;
@property (weak, nonatomic) IBOutlet UIButton *leftPhoto;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;

- (IBAction)makePopUp:(id)sender;
- (IBAction)showQuestion:(id)sender;
- (IBAction)incrementScore:(id)sender;

// should this be weak? 
@property (copy, nonatomic) NSString *question;
@property (nonatomic) int score;
@end
