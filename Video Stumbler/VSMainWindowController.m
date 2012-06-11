//
//  VSMainWindowController.m
//  Video Stumbler
//
//  Created by Pim Snel on 03-11-11.
//  Copyright (c) 2011 Lingewoud B.V. All rights reserved.
//

#import "VSMainWindowController.h"
#import "VSStumbleUponWebView.h"

@implementation VSMainWindowController

@synthesize replaceView;
@synthesize videoTitle;
@synthesize SUWebView;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    [self.window setBackgroundColor:[NSColor blackColor]];

    NSRect frame = [replaceView frame];
    [replaceView removeFromSuperview];

    SUWebView = [[VSStumbleUponWebView alloc] initWithNibName:@"VSStumbleUponWebView" bundle:nil];
    [SUWebView.webView setHidden:YES];
    [SUWebView.webView setDrawsBackground:NO];

    [[self.window contentView] addSubview:SUWebView.view];
    SUWebView.view.frame = frame;
    



   // CTFontManagerRegisterFontsForURL(fileURL,KCTFontManagerScopeProcess,nil);
    

}

-(void)keyDown:(NSEvent*)event
{   
    [[NSApp delegate] handleKeyCode:[event keyCode]];    
}




@end
