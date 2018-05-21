//
//  UIView+RZColorful.h
//  RZColorfulExample
//
//  Created by rztime on 2017/11/16.
//  Copyright © 2017年 rztime. All rights reserved.
//


/**** 使用时，请直接在需要的地方 #import "RZColorful.h" **********/

#import <UIKit/UIKit.h>
#import "RZColorfulConferrer.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (RZColorful)

/**
 仅UILabel、UITextField、UITextView 使用有效 设置富文本，原内容将清除
 
 @param attribute block description
 */
- (void )rz_colorfulConfer:(void(^)( RZColorfulConferrer * _Nonnull  confer))attribute;

/**
 仅UILabel、UITextField、UITextView 使用有效 追加新的富文本，原内容仍在
 
 @param attribute block description
 */
- (void )rz_colorfulConferAppend:(void (^)(RZColorfulConferrer * _Nonnull confer))attribute RZWARNING("请使用rz_colorfulConferInsetTo: append:方法");

/**
 仅UILabel、UITextField、UITextView 使用有效  插入文本到头、尾、光标位置
 
 @param position 插入的位置
 @param attribute 新的内容
 */
- (void )rz_colorfulConferInsetTo:(rzConferInsertPosition)position append:(void (^)(RZColorfulConferrer * _Nonnull confer))attribute;


/**
 仅UILabel、UITextField、UITextView 使用有效  添加到指定位置
 
 @param location 位置
 @param attribute  attribute
 */
- (void )rz_colorfulConferInsetToLocation:(NSUInteger)location append:(void (^)(RZColorfulConferrer * _Nonnull confer))attribute;

@end
NS_ASSUME_NONNULL_END
