//
//  ViewController.h
//  RideShare
//
//  Created by MAXTAK on 4/8/13.
//  2013 StackMob.
//

#import <UIKit/UIKit.h>
#import "SMClient.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) SMClient *client;
@property (weak, nonatomic) IBOutlet UIButton *buttonLoginLogout;

@property (retain, nonatomic) IBOutlet UIButton *nextbutton;

- (IBAction)buttonClickHandler:(id)sender;
- (IBAction)link;

@end
