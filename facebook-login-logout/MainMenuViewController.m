//
//  nextViewController.m
//  facebook-login-logout
//
//  Created by Ahmad on 4/7/13.
//  Copyright (c) 2013 StackMob. All rights reserved.
//

#import "MainMenuViewController.h"
#import "DisclaimerViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
   /* BOOL terms = [[NSUserDefaults standardUserDefaults] boolForKey:@"disclaimerAccepted"];
    DisclaimerViewController *disclaimer = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginIdentifier"];
    
    if (!terms) {
        [self.navigationController presentViewController:disclaimer animated:NO];
    }*/
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
