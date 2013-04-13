//
//  RequestRideTwoViewController.h
//  RideShare
//
//  Created by MAXTAK on 4/8/13.
//  2013 StackMob.
//

#import <UIKit/UIKit.h>

@interface RequestRideTwoViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *destinationPicker;
@property (strong, nonatomic) NSArray *destination;

@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

@end
