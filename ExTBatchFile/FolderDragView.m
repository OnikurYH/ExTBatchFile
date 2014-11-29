//
//  FolderDragView.m
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

#import "FolderDragView.h"

@implementation FolderDragView

- (void)awakeFromNib
{
    [self registerForDraggedTypes:[NSArray arrayWithObject:NSFilenamesPboardType]];
}

- (NSDragOperation)draggingEntered:(id < NSDraggingInfo >)sender
{
    return NSDragOperationCopy;
}

- (NSDragOperation)draggingUpdated:(id<NSDraggingInfo>)sender
{
    return NSDragOperationCopy;
}

- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender
{
    NSPasteboard *pboard = [sender draggingPasteboard];
    
    if ( [[pboard types] containsObject:NSURLPboardType] )
    {
        NSURL *fileURL = [NSURL URLFromPasteboard:pboard];
        BOOL isDirectory;
        BOOL fileExistsAtPath = [[NSFileManager defaultManager] fileExistsAtPath:[fileURL path] isDirectory:&isDirectory];
        if (fileExistsAtPath && isDirectory && [[[NSFileManager defaultManager] contentsOfDirectoryAtPath:[fileURL path] error:nil] count] > 0)
        {
            [_mainVC showOption:[fileURL path]];
            self.hidden = YES;
        }
        else
            return false;
    }
    return YES;
}

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    // Drawing code here.
}

@end
