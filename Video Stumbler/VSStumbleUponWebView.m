//
//  VSStumbleUponWebView.m
//  Video Stumbler
//
//  Created by Pim Snel on 03-11-11.
//  Copyright (c) 2011 Lingewoud B.V. All rights reserved.
//

#import "VSStumbleUponWebView.h"
#import <WebKit/WebView.h>
#import <WebKit/WebFrame.h>

@implementation VSStumbleUponWebView
@synthesize webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    
    return self;
}

-(void) loadView{
    [super loadView];
    [webView setFrameLoadDelegate:self];
    [self reloadStumbleUrl];
    NSLog(@"WebView at your service");
 
}

/* WEBVIEW DELEGATES */

- (void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame
{
    
    if([self checkUserLoggedIn])
    {
        [self optimizeWebpage];
        
        NSLog(@"finished loading");
        //    [[videoPanel contentView]setAlphaValue:1.0];
        [webView setHidden:NO];
        
        //[titleView removeFromSuperview];
        //[self addSubview:titleView positioned:NSWindowAbove relativeTo:nil];
        
    }
    else
    {
        
        //logInView = [[VSLogInView alloc] initWithNibName:@"VSLogInView" bundle:nil];
        //[jobMgrView setView:jobMngrController.view];
        /*
         user better method
         */
        //NSRect screenRect;
        //screenRect = [[NSScreen mainScreen] frame];
        //[mainWindow setContentView:[logInView contentView]];
        
        //[loginWindow setFrame:screenRect display:YES];  
        
        NSLog(@"ask user to login");    
    }
}

- (BOOL) checkUserLoggedIn
{
    return YES;
    
    // http://www.stumbleupon.com/login.php
    //
    
    NSString *jscmd = @"globals['loggedIn']";   
    
    WebScriptObject *win = [webView windowScriptObject];
    
    NSString *loggedIn = [win evaluateWebScript:jscmd];
    
    if([[loggedIn className] isEqualToString:@"WebUndefined"])
    {
        return NO;
    }
    else if(loggedIn)
    {
        /* 
         NSString *newNickname = [win evaluateWebScript:@"globals['user']['nickname']"];
        
        [nickname setStringValue:newNickname];
        NSLog(@"loggedIn %@", [loggedIn className]);
        NSLog(@"loggedIn %@", loggedIn);
        
        NSLog(@"nick %@", newNickname);
        */
        return YES;
         
    }
    else
    {
        return NO;
    }
}

-(void)sendLike
{   
    NSString *jscmd = @"$('#like').click()";   
    WebScriptObject *win = [webView windowScriptObject];
    [win evaluateWebScript:jscmd];   
    
//    [flashMessageLabel setStringValue:@"Like!"];    
 //   [flashMessageLabel setAlphaValue:1.0];
}

-(void)sendUnLike
{
    NSString *jscmd = @"$('#notLike').click()";   
    WebScriptObject *win = [webView windowScriptObject];
    [win evaluateWebScript:jscmd];
    
   // [flashMessageLabel setStringValue:@"UnLike!"];    
   // [flashMessageLabel setAlphaValue:1.0];
}

-(void)optimizeWebpage
{
    //TODO
    // - replace &amp; etc... from Title
    
    NSString *jscmd = @"$('#SUwebTb').remove()";   
    NSString *jscmd2 = @"$('#stumbleFrame').css('top','0px')";   
    NSString *jscmd3 = @"$('#stumbleFrame').height($('#stumbleFrame').height()+60)"; 
    NSString *jscmd4 = @"$('#stumbleFrame').contents().find('#vidtitleText').html();"; 
//    NSString *jscmd5 = @"$('#stumbleFrame').contents().find('#vidtitleText').css('font-size','50px')";     
//    NSString *jscmd6 = @"$('#stumbleFrame').contents().find('#vidtitleText').css('color','white')";     
//    NSString *jscmd7 = @"$('#stumbleFrame').contents().find('#vidtitleText').css('padding-left','50px;')";     
    //NSString *jscmd7 = @"$('#stumbleFrame').contents().find('#vidtitleText').remove();"; 
    NSString *jscmd7 = @"$('#stumbleFrame').contents().find('#headerVideo').remove();"; 

    
    //vidtitleText
    WebScriptObject *win = [webView windowScriptObject];
    [win evaluateWebScript:jscmd];
    [win evaluateWebScript:jscmd2];
    [win evaluateWebScript:jscmd3];
    NSString *videoTitle = [win evaluateWebScript:jscmd4];
//    [win evaluateWebScript:jscmd4];
//    [win evaluateWebScript:jscmd5];
//    [win evaluateWebScript:jscmd6];

    
    [win evaluateWebScript:jscmd7];
    [[NSApp delegate] setVideoTitle:videoTitle];
    
}



- (void)reloadStumbleUrl
{
    //[webView setHidden:YES];
   // [flashMessageLabel setStringValue:@""];    
   // [flashMessageLabel setAlphaValue:0.0];
    
    WebFrame *mainFrame = [webView mainFrame];
    NSURL *url = [NSURL URLWithString:@"http://www.stumbleupon.com/to/stumble/tag:Video"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [mainFrame loadRequest:request]; 
    
    NSLog(@"stumble");
}


- (void)loadLoginUrl
{
    //[webView setHidden:YES];
  //  [flashMessageLabel setStringValue:@""];    
  //  [flashMessageLabel setAlphaValue:0.0];
    
    WebFrame *mainFrame = [webView mainFrame];
    NSURL *url = [NSURL URLWithString:@"http://www.stumbleupon.com/to/stumble/tag:Video"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [mainFrame loadRequest:request]; 
    
    NSLog(@"login");
}



@end
