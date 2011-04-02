#import "MainViewController.h"

@implementation MainViewController


/*!
 * @discussion  The designated initializer. Override to perform setup that is
 *              required before the view is loaded.
 */
- ( id )initWithNibName: ( NSString * )nibNameOrNil bundle: ( NSBundle * )nibBundleOrNil
{
    if( ( self = [ super initWithNibName: nibNameOrNil bundle: nibBundleOrNil ] ) )
    {}
    
    return self;
}

/*!
 * @discussion  Implement loadView to create a view hierarchy programmatically,
 *              without using a nib.
 */
/*
- ( void )loadView
{}
*/

/*!
 * @discussion  Implement viewDidLoad to do additional setup after loading the
 *              view, typically from a nib.
 */
- ( void )viewDidLoad
{
    [ super viewDidLoad ];
}

/*!
 * @discussion  Override to allow orientations other than the default portrait
 *              orientation.
 */
- ( BOOL )shouldAutorotateToInterfaceOrientation: ( UIInterfaceOrientation )interfaceOrientation
{
    ( void )interfaceOrientation;
    
    return YES;
}

/*!
 * @discussion  Release any cached data, images, etc that aren't in use.
 */
- ( void )didReceiveMemoryWarning
{
    [ super didReceiveMemoryWarning ];
}

/*!
 * @discussion  Release any retained subviews of the main view.
 */
- ( void )viewDidUnload
{}

/*!
 * @discussion  Called when the object is freed by the Objective-C runtime
 */
- ( void )dealloc
{
    [ super dealloc ];
}

@end
