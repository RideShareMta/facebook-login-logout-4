//
//  RequestRideThreeViewController.m
//  RideShare
//
//  Created by MAXTAK on 4/8/13.
//  2013 StackMob.
//


#import "RequestRideThreeViewController.h"

@interface RequestRideThreeViewController ()

@end

@implementation RequestRideThreeViewController
@synthesize scroll;

NSString *url = @"www.rideshare.ca/server.php?";
NSString *textinput[];

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
    [scroll setScrollEnabled:YES];
    [scroll setContentSize:CGSizeMake(360, 900)];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setScroll:nil];
    [super viewDidUnload];
}
@end
