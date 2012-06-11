//
//  VSWebViewContainerView.m
//  Video Stumbler
//
//  Created by Pim Snel on 08-11-11.
//  Copyright (c) 2011 Lingewoud B.V. All rights reserved.
//

#import "VSWebViewContainerView.h"

@implementation VSWebViewContainerView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    [[NSColor blackColor] setFill];
    NSRectFill(dirtyRect);
}

@end
