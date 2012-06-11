//
//  VSAppDelegate.m
//  Video Stumbler
//
//  Created by Pim Snel on 12-09-11.
//  Copyright 2011 Lingewoud B.V. All rights reserved.
//

#import "VSAppDelegate.h"

#import "HIDRemote.h"


@implementation VSAppDelegate

//@synthesize webView_;
//@synthesize videoPanel;
//@synthesize helpView;
//@synthesize flashMessageLabel;
//@synthesize loginWindow;


@synthesize mainWindowController;
//@synthesize mainContentView;



#pragma mark -
#pragma mark Default delegates

- (void)awakeFromNib {
    [self initRemoteControlInterface];   
    [self registerEmbeddedFonts];
}


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    VSMainWindowController* windowController;
    windowController = [[VSMainWindowController alloc] initWithWindowNibName:@"VSMainWindow"];
    [windowController showWindow:nil];
    self.mainWindowController = windowController;
    [self.mainWindowController.videoTitle setStringValue:@""];
    [self.mainWindowController.videoTitle setFont:[NSFont fontWithName:@"EnzoOT-Light" size:44]];
    [windowController release];
}


- (void)applicationWillTerminate:(NSNotification *)notification
{
}

#pragma mark -
#pragma mark other methods

- (void)setVideoTitle:(NSString*)titleText {
    [self.mainWindowController.videoTitle setStringValue:titleText];
}


- (void)initRemoteControlInterface {
    
    if ([HIDRemote isCandelairInstallationRequiredForRemoteMode:kHIDRemoteModeExclusiveAuto])
    {
        // Candelair needs to be installed. Inform the user about it.
    }	
    else
    {
        // Start using HIDRemote ..
        HIDRemoteMode remoteMode;
        HIDRemote *hidRemote;
        
        hidRemote = [HIDRemote sharedHIDRemote];
        //        hidRemote = [[HIDRemote alloc] init];
        remoteMode = kHIDRemoteModeExclusiveAuto;
        
        [[HIDRemote sharedHIDRemote] setDelegate:self];
        
        if (remoteMode == kHIDRemoteModeExclusive)
		{
			// When used in exclusive, non-auto mode, enable exclusive lock lending. This isn't required
			// but there are good reasons to do this.
			[hidRemote setExclusiveLockLendingEnabled:YES];
		}
		
		// Start remote control
		if ([hidRemote startRemoteControl:remoteMode])
		{
			// Start was successful
			NSLog(@"HIDRemote started successfully");
		}
		else
		{
			// Start failed
			NSLog(@"Couldn't start HIDRemote");
		}
    }
}

- (void)registerEmbeddedFonts {
    //Register
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"EnzoOT-Light" ofType:@"otf"];
    NSURL * fileURL = [NSURL fileURLWithPath: filePath];
    CTFontManagerRegisterFontsForURL((CFURLRef)fileURL, kCTFontManagerScopeProcess, nil);
    fileURL = nil;
    filePath = nil;
}


-(void)toggleFullScreen {
    NSView *view = [[self.mainWindowController window] contentView];
    if ([view isInFullScreenMode])
        [view exitFullScreenModeWithOptions:nil];
    
    
    else{
        [view enterFullScreenMode:[NSScreen mainScreen] withOptions:nil];
    }
}

-(void) handleKeyCode:(int)keyCode {
    
    switch( keyCode ) {
        case 42:// escape key      
            NSLog(@"toggle fullscreen");
            
            [self toggleFullScreen];
            
            break;
            
        case 53:// escape key      
            NSLog(@"show quit menu");
            
            break;
        case 126:// up arrow          
            
            [[NSApp delegate] sendLike];                        
            break;
        case 125:// down arrow
            [[NSApp delegate] sendUnLike];            
            break;
        case 124:// right arrow
            [self setVideoTitle:@""];
            [self.mainWindowController.SUWebView.webView setHidden:YES];
            [self.mainWindowController.SUWebView reloadStumbleUrl];

            
            break;
        case 123:// left arrow
            
            break;
            
            
        default:
            NSLog(@"Other Key pressed: %i", keyCode);
            break;
    }
}

- (void)hidRemote:(HIDRemote *)hidRemote 
  eventWithButton:(HIDRemoteButtonCode)buttonCode 
        isPressed:(BOOL)isPressed 
fromHardwareWithAttributes:(NSMutableDictionary *)attributes
{
	NSLog(@"%@: Button with code %d %@", hidRemote, buttonCode, (isPressed ? @"pressed" : @"released"));
    
    if(isPressed)
    {
        if(buttonCode == 4)
        {
             [self handleKeyCode:124];
        }
        else if(buttonCode == 1)
        {
             [self handleKeyCode:126];           
        }
        else if(buttonCode == 2)
        {
             [self handleKeyCode:125];                       
        }
        else if(buttonCode == 3)
        {
            [self handleKeyCode:123];                       
        }
    }
    
    
}

/*
 - (void)showHelpPanel
{
    [[helpView layer] setZPosition:1.0f];
    [[helpView animator] setAlphaValue:0.8];
    [helpView setHidden:NO];
    [webView_ setHidden:YES];
    
    if([helpView isHidden])
    {
        NSLog(@"Help is hidden");        
    }
    else
    {
        NSLog(@"Help is not hidden");
    }
}

- (void)hideHelpPanel
{
    [[helpView animator] setAlphaValue:0.0];
    [webView_ setHidden:NO];
    [helpView setHidden:YES];
    
    if([helpView isHidden])
    {
        NSLog(@"Help is hidden");        
    }
    else
    {
        NSLog(@"Help is not hidden");
    }
}

- (IBAction) tryAgainButtonAction:(id)sender
{
    //  [self reloadStumbleUrl];
    // [self makeFullScreen];
}
 */


@end
