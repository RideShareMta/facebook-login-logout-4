//
//  RequestRideTwooViewController.m
//  RideShare
//
//  Created by MAXTAK on 4/8/13.
//  2013 StackMob.
//

#import "RequestRideTwooViewController.h"

@interface RequestRideTwooViewController ()

@end

@implementation RequestRideTwooViewController
@synthesize scroll;

@synthesize locationPicker;
@synthesize location = _location;

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
    _location = [[NSArray alloc] initWithObjects:@"Mt. A Student Center", @"Circle K, Main Street", nil];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _location.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [_location objectAtIndex:row];
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
