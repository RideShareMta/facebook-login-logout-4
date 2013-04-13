//
//  RequestRideTwoViewController.m
//  RideShare
//
//  Created by MAXTAK on 4/8/13.
//  2013 StackMob.
//

#import "RequestRideTwoViewController.h"

@interface RequestRideTwoViewController ()

@end

@implementation RequestRideTwoViewController
@synthesize scroll;

@synthesize destinationPicker;
@synthesize destination = _destination;

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
    _destination = [[NSArray alloc] initWithObjects:@"Moncton NB", @"Halifax NS", @"Fredericton NB", @"Saint John NB", @"Campbellton NB", @"Edmunston NB", @"Charlottetown PEI", @"Summerside PEI", @"Saint John's NL", nil];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _destination.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [_destination objectAtIndex:row];
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
