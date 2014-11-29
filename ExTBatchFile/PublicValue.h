//
//  PublicValue.h
//  ExTBatchFile
//
//  Created by Onikur Chan on 29/11/14.
//  Copyright (c) 2014 TANPN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicValue : NSObject

+ (NSString *) getFormattedFileName:(NSString *)fileNameStyle index:(int) index fileName:(NSString *) fileName date:(NSString *) date time:(NSString *) time;

@end
