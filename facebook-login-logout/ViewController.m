//
//  ViewController.m
//  RideShare
//
//  Created by MAXTAK on 4/8/13.
//  2013 StackMob.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "StackMob.h"

@interface ViewController ()

- (void)openSession;

@end

@implementation ViewController


@synthesize managedObjectContext = _managedObjectContext;

-(IBAction)link{
    [[UIApplication sharedApplication]
     openURL:[NSURL URLWithString:@"http://www.kevincain.ca/rsa_wp/"]];
}

- (AppDelegate *)appDelegate {
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self updateView];
    
    self.client = [self.appDelegate client];
    
    if (FBSession.activeSession.state == FBSessionStateCreatedTokenLoaded) {
        [FBSession openActiveSessionWithReadPermissions:nil allowLoginUI:YES completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
            [self sessionStateChanged:session state:status error:error];
        }];
    }
    
    self.managedObjectContext = [[self.appDelegate coreDataStore] contextForCurrentThread];
}

- (void)updateView {

    if ([self.client isLoggedIn]) {
         self.nextbutton.enabled = YES;
        [self.nextbutton setTitleColor:[UIColor colorWithRed:(162/255.0) green:(184/255.0) blue:(152/255.0) alpha:1] forState:UIControlStateNormal];
        [self.buttonLoginLogout setTitle:@"Log out" forState:UIControlStateNormal];
        [self.buttonLoginLogout setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    } else {
        self.nextbutton.enabled = NO;
        [self.nextbutton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.buttonLoginLogout setTitle:@"Login with Facebook" forState:UIControlStateNormal];
        [self.buttonLoginLogout setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
}

- (void)viewDidUnload
{
    [self setButtonLoginLogout:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)buttonClickHandler:(id)sender {

    if ([self.client isLoggedIn]) {
        [self logoutUser];
    } else {
        [self openSession];
    }
}


- (void)loginUser {
    
    /*
     Initiate a request for the current Facebook session user info, and apply the username to
     the StackMob user that might be created if one doesn't already exist.  Then login to StackMob with Facebook credentials.
     */
    [[FBRequest requestForMe] startWithCompletionHandler:
     ^(FBRequestConnection *connection,
       NSDictionary<FBGraphUser> *user,
       NSError *error) {
         if (!error) {
             [self.client loginWithFacebookToken:FBSession.activeSession.accessTokenData.accessToken createUserIfNeeded:YES usernameForCreate:user.username onSuccess:^(NSDictionary *result) {
                 NSLog(@"Logged in with StackMob");
                 [self updateView];
             } onFailure:^(NSError *error) {
                 NSLog(@"Error: %@", error);
             }];
         } else {
             // Handle error accordingly
             NSLog(@"Error getting current Facebook user data, %@", error);
         }
         
     }];
}


- (void)logoutUser {
    
    [self.client logoutOnSuccess:^(NSDictionary *result) {
        NSLog(@"Logged out of StackMob");
        [FBSession.activeSession closeAndClearTokenInformation];
    } onFailure:^(NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)openSession
{
    NSArray *permissions = [NSArray arrayWithObjects:@"user_photos",
                            nil];
    
    [FBSession openActiveSessionWithReadPermissions:permissions
                                       allowLoginUI:YES
                                  completionHandler:
     ^(FBSession *session,
       FBSessionState state, NSError *error) {
         [self sessionStateChanged:session state:state error:error];
     }];
}

- (void)sessionStateChanged:(FBSession *)session
                      state:(FBSessionState) state
                      error:(NSError *)error
{
    switch (state) {
        case FBSessionStateOpen:
            [self loginUser];
            break;
        case FBSessionStateClosed:
            [FBSession.activeSession closeAndClearTokenInformation];
            [self updateView];
            break;
        case FBSessionStateClosedLoginFailed:
            [FBSession.activeSession closeAndClearTokenInformation];
            break;
        default:
            break;
    }
    
    [[NSNotificationCenter defaultCenter]
     postNotificationName:SCSessionStateChangedNotification
     object:session];
    
    if (error) {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Error"
                                  message:error.localizedDescription
                                  delegate:nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
    }
}

@end
