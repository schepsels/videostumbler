//
//  VSMainContentView.m
//  Video Stumbler
//
//  Created by Pim Snel on 04-11-11.
//  Copyright (c) 2011 Lingewoud B.V. All rights reserved.
//

#import "VSMainContentView.h"

@implementation VSMainContentView

@synthesize image;


- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{

    // BG IMAGE DISABLED BECAUSE WE ARE USING THE WEBVIEW WITH BLACK
    self.image = [NSImage imageNamed:@"video-Stumbler-bg.jpg"];
    [image drawInRect:[self bounds] fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1];
    
    [[NSColor blackColor] setFill];
    NSRectFill(dirtyRect);
}

- (BOOL)xisFlipped
{
    return YES;
}

- (void)xxsetImage:(NSImage *)newImage
{
    [newImage retain];
    [image release];
    image = newImage;
    
    [image setFlipped:YES];
    [self setNeedsDisplay:YES];
}

-(void)keyDown:(NSEvent*)event
{   
    [[NSApp delegate] handleKeyCode:[event keyCode]];    
}

@end
