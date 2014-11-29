//
//  PublicValue.m
//  ExTBatchFile
//
//  Created by Onikur Chan on 29/11/14.
//  Copyright (c) 2014 TANPN. All rights reserved.
//

#import "PublicValue.h"

@implementation PublicValue

+ (NSString *) getFormattedFileName:(NSString *)fileNameStyle index:(int) index fileName:(NSString *) fileName date:(NSString *) date time:(NSString *) time
{
    NSString* fStr = fileNameStyle;
    fStr = [fStr stringByReplacingOccurrencesOfString:@"{id}" withString:[NSString stringWithFormat:@"%i", index]];
    fStr = [fStr stringByReplacingOccurrencesOfString:@"{fname}" withString:[fileName stringByDeletingPathExtension]];
    fStr = [fStr stringByReplacingOccurrencesOfString:@"{exte}" withString:[fileName pathExtension]];
    fStr = [fStr stringByReplacingOccurrencesOfString:@"{bdate}" withString:date];
    fStr = [fStr stringByReplacingOccurrencesOfString:@"{btime}" withString:time];
    return fStr;
}

@end
