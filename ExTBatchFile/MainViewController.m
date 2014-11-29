//
//  ViewController.m
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

#import "MainViewController.h"
#import "ProcessView.h"

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject
{
    [super setRepresentedObject:representedObject];
    // Update the view, if already loaded.
}

- (void) showOption: (NSString *) path;
{
    [_tabMain selectTabViewItemAtIndex:1];
    [_optionView setTargetFolder:path];
}

- (void)prepareForSegue:(NSStoryboardSegue *)segue sender:(id)sender {
    //NSLog(@"%@", segue.identifier);
    if ([segue.identifier isEqualToString:@"ProcessView"])
    {
        ProcessView *processView = segue.destinationController;
        [processView processBatchFile:[_optionView getTargetFolder] fileNameStyle:[_optionView getFilenameStyle]];
    }
}

@end
