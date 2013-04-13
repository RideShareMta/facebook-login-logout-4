//
//  RequestRideMenuViewController.m
//  RideShare
//
//  Created by MAXTAK on 4/8/13.
//  2013 StackMob.
//

#import "RequestRideMenuViewController.h"

@interface RequestRideMenuViewController ()

@end

@implementation RequestRideMenuViewController

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)viarail:(id)sender {
    [[UIApplication sharedApplication]
     openURL:[NSURL URLWithString:@"http://www.viarail.ca"]];
}

- (IBAction)maritimebus:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.maritimebus.com/en/"]];
}
- (void)viewDidUnload {
  
    [super viewDidUnload];
}
@end
