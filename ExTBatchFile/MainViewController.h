//
//  ViewController.h
//  ExTBatchFile
//
//  Created by Onikur Chan on 29/11/14.
//  Copyright (c) 2014 TANPN. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "OptionView.h"

@interface MainViewController : NSViewController

@property (nonatomic, strong) IBOutlet NSTabView *tabMain;

@property (nonatomic, strong) IBOutlet OptionView *optionView;

- (void) showOption:(NSString *) path;

@end

