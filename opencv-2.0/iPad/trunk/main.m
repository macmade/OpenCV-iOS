/*!
 * @description     C entry point function
 */
int main( int argc, char * argv[] )
{
    NSAutoreleasePool * pool;
    int                 exitStatus;
    
    pool       = [ [ NSAutoreleasePool alloc ] init ];
    exitStatus = UIApplicationMain( argc, argv, nil, nil );
    
    [ pool release ];
    
    return exitStatus;
}
