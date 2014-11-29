//
//  ViewController.m
//  ExTBatchFile
//
//  Created by Onikur Chan on 29/11/14.
//  Copyright (c) 2014 TANPN. All rights reserved.
//

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
