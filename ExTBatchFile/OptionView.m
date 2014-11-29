//
//  OptionView.m
//  ExTBatchFile
//
//  Created by Onikur Chan on 29/11/14.
//  Copyright (c) 2014 TANPN. All rights reserved.
//

#import "OptionView.h"

@implementation OptionView
{
    NSString *targetFolder;
}
@synthesize lbTargetFolder, txtFileNameStyle, btnStartBatch;

- (void) setTargetFolder: (NSString*) path
{
    targetFolder = path;
    [lbTargetFolder setStringValue:targetFolder];
    //NSLog(@"%@", targetFolder);
}

- (void) controlTextDidChange:(NSNotification *) obj
{
    if ([[obj object] isEqual:txtFileNameStyle])
    {
        if ([[txtFileNameStyle stringValue] isEqualToString:@""])
        {
            [btnStartBatch setEnabled: NO];
        }
        else
            [btnStartBatch setEnabled: YES];
    }
}

- (NSString *) getTargetFolder
{
    return targetFolder;
}

- (NSString *) getFilenameStyle
{
    return [txtFileNameStyle stringValue];
}

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    // Drawing code here.
}

@end
