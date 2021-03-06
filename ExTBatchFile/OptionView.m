//
//  OptionView.m
//  ExTBatchFile
//
//  Created by Onikur Chan on 29/11/14.
//  Copyright (c) 2014 TANPN. All rights reserved.
//
//  This file is part of ExTBatchFile.
//
//  ExTBatchFile is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  ExTBatchFile is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with ExTBatchFile.  If not, see <http://www.gnu.org/licenses/>.

#import "OptionView.h"
#import "PublicValue.h"

@implementation OptionView
{
    NSString *targetFolder;
    NSString *exampleFileName;
}
@synthesize lbTargetFolder, txtFileNameStyle, lbPreview, btnStartBatch;

- (void) setTargetFolder: (NSString*) path
{
    targetFolder = path;
    [lbTargetFolder setStringValue:targetFolder];
    exampleFileName = [[[NSFileManager defaultManager] contentsOfDirectoryAtURL:[NSURL fileURLWithPath:targetFolder]
                                 includingPropertiesForKeys:[NSArray arrayWithObject:NSURLNameKey]
                                                    options:NSDirectoryEnumerationSkipsHiddenFiles
                                                      error:nil] objectAtIndex:0];\
    exampleFileName = [exampleFileName lastPathComponent];
    [lbPreview setStringValue:[PublicValue getFormattedFileName:[txtFileNameStyle stringValue] index:1 fileName:exampleFileName date:@"20141129" time:@"00-00-00"]];
}

- (void) controlTextDidChange:(NSNotification *) obj
{
    if ([[obj object] isEqual:txtFileNameStyle])
    {
        if ([[txtFileNameStyle stringValue] isEqualToString:@""])
        {
            [btnStartBatch setEnabled: NO];
            [btnStartBatch setTitle:@"File name format cannot be empty"];
        }
        else if ([[txtFileNameStyle stringValue] rangeOfString:@"{id}"].location == NSNotFound)
        {
            [btnStartBatch setEnabled: NO];
            [btnStartBatch setTitle:@"File name format cannot not {id} tag"];
        }
        else
        {
            [btnStartBatch setEnabled: YES];
            [btnStartBatch setTitle:@"Start !"];
            [lbPreview setStringValue:[PublicValue getFormattedFileName:[txtFileNameStyle stringValue]
                                                    index:1
                                                    fileName:exampleFileName
                                                    date:@"20141129"
                                                    time:@"00-00-00"]];
        }
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
