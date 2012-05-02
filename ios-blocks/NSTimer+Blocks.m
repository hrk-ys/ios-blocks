//
//  NSTimer+Blocks.m
//  ios-blocks
//
//  Created by Yoshifuji Hiroki on 12/05/03.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NSTimer+Blocks.h"

@implementation NSTimer (Blocks)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti block:(NSTimerBlock)block repeats:(BOOL)yesOrNo
{
    return [NSTimer scheduledTimerWithTimeInterval:ti target:self selector:@selector(_callback:) userInfo:[[block copy] autorelease] repeats:yesOrNo];
}

+ (void)_callback:(NSTimer*)timer
{
    NSTimerBlock block = [timer userInfo];
    block(timer);
}

@end