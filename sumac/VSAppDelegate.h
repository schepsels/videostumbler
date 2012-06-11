//
//  VSAppDelegate.h
//  Video Stumbler
//
//  Created by Pim Snel on 12-09-11.
//  Copyright 2011 Lingewoud B.V. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <ApplicationServices/ApplicationServices.h>
#import "VSLogInView.h"
#import "VSMainWindowController.h"
#import "VSMainContentView.h"



@interface VSAppDelegate : NSObject <NSApplicationDelegate> {
    
//    WebView *webView_;
    
//    NSWindow *videoPanel;
//    NSWindow *loginWindow;
    
//    VSLogInView *logInView;

//    NSView *helpView;
//    NSTextField *flashMessageLabel;
//    NSTextField *nickname;
}

//- (void) showHelpPanel;
//- (void) hideHelpPanel;


//- (void) makeFullScreen;
//- (IBAction)tryAgainButtonAction:(id)sender;


- (void)toggleFullScreen;
- (void)registerEmbeddedFonts;
- (void)initRemoteControlInterface;
- (void)handleKeyCode:(int)keyCode;
- (void)setVideoTitle:(NSString*)titleText;



@property (retain) VSMainWindowController* mainWindowController;
//@property (retain) VSMainContentView* mainContentView;


//@property (assign) IBOutlet WebView *webView_;
//@property (assign) IBOutlet NSWindow *videoPanel;
//@property (assign) IBOutlet NSWindow *loginWindow;
//@property (assign) IBOutlet NSView *helpView;
//@property (assign) IBOutlet NSTextField *flashMessageLabel;
//@property (assign) IBOutlet NSTextField *nickname;


@end
