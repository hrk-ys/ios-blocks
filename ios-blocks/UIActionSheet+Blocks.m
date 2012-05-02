//
//  UIActionSheet+Blocks.m
//  ios-blocks
//
//  Created by Yoshifuji Hiroki on 12/05/03.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UIActionSheet+Blocks.h"

@implementation UIActionSheet (Blocks)

- (id)initWithTitle:(NSString *)title block:(void(^)(NSInteger))block cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... {

    self = [self initWithTitle:title delegate:nil cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:destructiveButtonTitle otherButtonTitles:nil];
    if (self) {
        self.delegate = [[[UIActionSheetCallback alloc] initWithCallback:block] autorelease];
        
        va_list args;
        va_start(args, otherButtonTitles);
        for (NSString *arg = otherButtonTitles; arg != nil; arg = va_arg(args, NSString*)) {
            [self addButtonWithTitle:arg];
        }
        va_end(args);
    }

    return self;
}

- (NSInteger)addButtonWithTitle:(NSString *)title withBlock:(void(^)(void))block {

    if (!self.delegate) {
        self.delegate = [[[UIActionSheetCallback alloc] init] autorelease];
    }
    
    NSInteger index = [self addButtonWithTitle:title];
    [((UIActionSheetCallback*)self.delegate).buttonCallbacks setObject:[[block copy] autorelease] forKey:[NSNumber numberWithInteger:index]];
    
    return index;
}

@end

@implementation UIActionSheetCallback

@synthesize callback;
@synthesize buttonCallbacks;

- (void)_init {
    self.buttonCallbacks = [NSMutableDictionary dictionary];
    [self retain];    
}

- (id)init {
    if (self = [super init]) {
        [self _init];
    }
    return self;
}

- (id)initWithCallback:(UIActionSheetCallback_t)aCallback {
    if(self = [super init]) {
        self.callback = aCallback;
        [self _init];
    }
    return self;
}

// UIAlertView の delegate メソッド
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(callback)
        callback(buttonIndex); 

    UIActionSheetButtonCallback_t buttonCallback = [buttonCallbacks objectForKey:[NSNumber numberWithInteger:buttonIndex]];
    if (buttonCallback)
        buttonCallback();

    [self release];
}

- (void)dealloc {
    self.callback = nil;
    self.buttonCallbacks = nil;
    [super dealloc];
}

@end