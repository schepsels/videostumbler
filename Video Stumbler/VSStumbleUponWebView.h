//
//  VSStumbleUponWebView.h
//  Video Stumbler
//
//  Created by Pim Snel on 03-11-11.
//  Copyright (c) 2011 Lingewoud B.V. All rights reserved.
//

#import <Cocoa/Cocoa.h>
//#import <WebKit/WebView.h>
//#import <WebKit/WebFrame.h>

@class WebView; 
@class WebUndefined; 

@interface VSStumbleUponWebView : NSViewController

- (void) sendLike;
- (void) sendUnLike;
- (BOOL) checkUserLoggedIn;
- (void) reloadStumbleUrl;
- (void) optimizeWebpage;

@property (assign) IBOutlet WebView *webView;


@end
