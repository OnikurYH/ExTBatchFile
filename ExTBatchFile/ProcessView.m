//
//  ProcessView.m
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

#import "ProcessView.h"

@interface ProcessView ()

@end

@implementation ProcessView
@synthesize lbProcess, btnFinish;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do view setup here.
}

- (void) processBatchFile: (NSString *) targetFolder fileNameStyle: (NSString *)fileNameStyle
{
    NSDictionary * args = @{@"targetFolder": targetFolder, @"fileNameStyle": fileNameStyle};
    
    [self performSelectorInBackground:@selector(action_processBatchFile:) withObject:args];
}

- (void) action_processBatchFile:(NSDictionary *)args
{
    NSString *targetFolder = args[@"targetFolder"];
    NSString *fileNameStyle = args[@"fileNameStyle"];
    
    [lbProcess setStringValue:@"Start to batch file..."];
    btnFinish.hidden = YES;
    
    NSString* file;
    NSDirectoryEnumerator* enumerator = [[NSFileManager defaultManager] enumeratorAtPath:targetFolder];
    int index = 1;
    while (file = [enumerator nextObject])
    {
        BOOL isDirectory = NO;
        NSString *fileFullPath = [NSString stringWithFormat:@"%@/%@", targetFolder, file];
        [[NSFileManager defaultManager] fileExistsAtPath: fileFullPath isDirectory: &isDirectory];
        if (!isDirectory && ![file hasPrefix:@"."])
        {
            NSString *formattedFileName = [self getFormattedFileName:fileNameStyle index: index fileName:file];
            [lbProcess setStringValue: [NSString stringWithFormat:@"Rename %@ to %@", file, formattedFileName]];
            NSString *newPath = [[fileFullPath stringByDeletingLastPathComponent] stringByAppendingPathComponent:formattedFileName];
            [[NSFileManager defaultManager] moveItemAtPath:fileFullPath toPath:newPath error:nil];
            index ++;
        }
    }
    
    [lbProcess setStringValue:[NSString stringWithFormat:@"Batch %i files!", index]];
    btnFinish.hidden = NO;
}

- (NSString *) getFormattedFileName:(NSString *)fileNameStyle index:(int) index fileName:(NSString *) fileName
{
    NSString* fStr = fileNameStyle;
    fStr = [fStr stringByReplacingOccurrencesOfString:@"{id}" withString:[NSString stringWithFormat:@"%i", index]];
    fStr = [fStr stringByReplacingOccurrencesOfString:@"{fname}" withString:[fileName stringByDeletingPathExtension]];
    fStr = [fStr stringByReplacingOccurrencesOfString:@"{exte}" withString:[fileName pathExtension]];
    return fStr;
}

@end
