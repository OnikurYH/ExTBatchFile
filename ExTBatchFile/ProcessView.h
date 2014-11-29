//
//  ProcessView.h
//  ExTBatchFile
//
//  Created by Onikur Chan on 29/11/14.
//  Copyright (c) 2014 TANPN. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ProcessView : NSViewController

@property (nonatomic, strong) IBOutlet NSTextField *lbProcess;
@property (nonatomic, strong) IBOutlet NSButton *btnFinish;

- (void) processBatchFile: (NSString *) targetFolder fileNameStyle: (NSString *)fileNameStyle;

@end
