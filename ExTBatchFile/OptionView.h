//
//  OptionView.h
//  ExTBatchFile
//
//  Created by Onikur Chan on 29/11/14.
//  Copyright (c) 2014 TANPN. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface OptionView : NSView

@property (nonatomic, strong) IBOutlet NSTextField *lbTargetFolder;
@property (nonatomic, strong) IBOutlet NSTextField *txtFileNameStyle;
@property (nonatomic, strong) IBOutlet NSButton *btnStartBatch;

- (void) setTargetFolder: (NSString*) path;
- (NSString *) getTargetFolder;
- (NSString *) getFilenameStyle;

- (void) controlTextDidChange:(NSNotification *)obj;

@end
