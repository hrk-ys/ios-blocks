//
//  UIActionSheet+Blocks.h
//  ios-blocks
//
//  Created by Yoshifuji Hiroki on 12/05/03.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

@interface UIActionSheet (Blocks)

typedef void (^UIActionSheetCallback_t)(NSInteger buttonIndex);
typedef void (^UIActionSheetButtonCallback_t)(void);


- (id)initWithTitle:(NSString *)title block:(UIActionSheetCallback_t)block cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

- (NSInteger)addButtonWithTitle:(NSString *)title withBlock:(UIActionSheetButtonCallback_t)block;

@end



@interface UIActionSheetCallback : NSObject <UIActionSheetDelegate> {
    UIActionSheetCallback_t callback;
    NSMutableDictionary* buttonCallbacks;
}

@property (nonatomic, copy) UIActionSheetCallback_t callback;
@property (nonatomic, retain) NSMutableDictionary* buttonCallbacks;

- (id)initWithCallback:(UIActionSheetCallback_t) callback;

@end