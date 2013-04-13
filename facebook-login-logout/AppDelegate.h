//
//  AppDelegate.h
//  RideShare
//
//  Created by MAXTAK on 4/8/13.
//  2013 StackMob.
//


#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <FacebookSDK/FacebookSDK.h>

@class SMClient;
@class SMCoreDataStore;
@class ViewController;

extern NSString *const SCSessionStateChangedNotification;
NSString *myString;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) SMCoreDataStore *coreDataStore;
@property (strong, nonatomic) SMClient *client;
@property (strong, nonatomic) ViewController *viewController;


@end
