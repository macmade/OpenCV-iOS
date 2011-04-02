@class MainViewController;

@interface ApplicationDelegate: NSObject < UIApplicationDelegate >
{
@protected
    
    UIWindow           * window;
    MainViewController * viewController;
}

@property( nonatomic, retain ) IBOutlet UIWindow           * window;
@property( nonatomic, retain ) IBOutlet MainViewController * viewController;

@end
