//
//  UIButton+NoConnectionClick.h
//  GQButton
//
//  Created by Smile on 2021/12/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//设置 图片及文字的位置
typedef enum {
    imgTop = 0, //图片在上 文字在下
    imgLeft, // 图在左 文在右
    imgRight, // 图在右 文字在左
    imgBottom // 图在下 文字在上 
}ButtonImgPosition;

@interface UIButton (NoConnectionClick)



/** 设置点击间隔时间  */
@property(nonatomic, assign) NSTimeInterval intervalTime;



/// 设置按钮图片和文字的位置
/// @param space 图片和文字之间的间距
/// @param type 图片位置的类型
-(void)resetImgWith:(CGFloat)space withType:(ButtonImgPosition)type;
@end

NS_ASSUME_NONNULL_END
