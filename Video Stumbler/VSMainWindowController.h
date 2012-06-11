//
//  VSMainWindowController.h
//  Video Stumbler
//
//  Created by Pim Snel on 03-11-11.
//  Copyright (c) 2011 Lingewoud B.V. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "VSStumbleUponWebView.h"

@interface VSMainWindowController : NSWindowController


@property (assign) VSStumbleUponWebView *SUWebView;
@property (assign) IBOutlet NSView *replaceView;
@property (assign) IBOutlet NSTextField *videoTitle;


@end
