//
//  NSTimer+Blocks.h
//  ios-blocks
//
//  Created by Yoshifuji Hiroki on 12/05/03.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

typedef void (^NSTimerBlock)(NSTimer*);

@interface NSTimer (Blocks)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti block:(NSTimerBlock)block repeats:(BOOL)yesOrNo;

@end
