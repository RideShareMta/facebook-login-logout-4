//
//  RequestRideTwooViewController.h
//  RideShare
//
//  Created by MAXTAK on 4/8/13.
//  2013 StackMob.
//

#import <UIKit/UIKit.h>

@interface RequestRideTwooViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *locationPicker;
@property (strong, nonatomic) NSArray *location;

@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

@end
