#import "ApplicationDelegate.h"
#import "MainViewController.h"
#import <opencv/cv.h>

@implementation ApplicationDelegate

@synthesize window;
@synthesize viewController;

#pragma mark -
#pragma mark Application lifecycle

/*!
 * @discussion  Override point for customization after app launch.
 */
- ( BOOL )application: ( UIApplication * )application didFinishLaunchingWithOptions: ( NSDictionary * )launchOptions
{
    ( void )application;
    ( void )launchOptions;
    
    [ window addSubview: viewController.view ];
    [ window makeKeyAndVisible ];
    
    return YES;
}

/*!
 * @discussion  Sent when the application is about to move from active to
 *              inactive state. This can occur for certain types of temporary
 *              interruptions (such as an incoming phone call or SMS message)
 *              or when the user quits the application and it begins the
 *              transition to the background state.
 *              Use this method to pause ongoing tasks, disable timers, and
 *              throttle down OpenGL ES frame rates. Games should use this
 *              method to pause the game.
 */
- ( void )applicationWillResignActive: ( UIApplication * )application
{
    ( void )application;
}

/*!
 * @discussion  Restart any tasks that were paused (or not yet started) while
 *              the application was inactive. If the application was previously
 *              in the background, optionally refresh the user interface.
 */
- ( void )applicationDidBecomeActive: ( UIApplication * )application
{
    ( void )application;
}

/*!
 * @discussion  Called when the application is about to terminate.
 *              See also applicationDidEnterBackground:.
 */
- ( void )applicationWillTerminate: ( UIApplication * )application
{
    ( void )application;
}

#pragma mark -
#pragma mark Memory management

/*!
 * @discussion  Free up as much memory as possible by purging cached data
 *              objects that can be recreated (or reloaded from disk) later.
 */
- ( void )applicationDidReceiveMemoryWarning: ( UIApplication * )application
{
    ( void )application;
}

/*!
 * @discussion  Called when the object is freed by the Objective-C runtime
 */
- ( void )dealloc
{
    [ viewController release ];
    [ window release ];
    [ super dealloc ];
}

@end
