//
//  UIButton+NoConnectionClick.m
//  GQButton
//
//  Created by Smile on 2021/12/24.
//

#import "UIButton+NoConnectionClick.h"




#import <objc/runtime.h>


@implementation UIButton (NoConnectionClick)

/**
 1.拦截系统方法
 2.用自定义的方法替换第一步拦截的方法
 3.在自定义的方法里尝试终止对连续点击的前面几次的响应
 */
#pragma mark --------拦截系统方法
+ (void)load{
    SEL systemSEL = @selector(sendAction:to:forEvent:);
    Method systemMethod = class_getInstanceMethod(self, systemSEL);
    
    SEL customSEL = @selector(custom_sendAction:to:forEvent:);
    Method customMethod = class_getInstanceMethod(self, customSEL);
    
    method_exchangeImplementations(systemMethod, customMethod);
}
#pragma mark ---------替换系统方法的自定义方法
-(void)custom_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    //是否小于设定的时间间隔
    BOOL needSendAction = (NSDate.date.timeIntervalSince1970 - self.acceptEventTime >= self.intervalTime);
    //更新上一次的点击时间戳
    if (self.intervalTime > 0) {
        self.acceptEventTime = NSDate.date.timeIntervalSince1970;
    }
    
    if (needSendAction) {
        //两次的点击时间间隔小于设定时间间隔时，才执行响应事件
        [self custom_sendAction:action to:target forEvent:event];
    }else{
        return;
    }
}
-(NSTimeInterval)acceptEventTime{
    return [objc_getAssociatedObject(self, "UIControl_acceptEventTime") doubleValue];
}

-(void)setAcceptEventTime:(NSTimeInterval)acceptEventTime{
    objc_setAssociatedObject(self, "UIControl_acceptEventTime", @(acceptEventTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark ----------关联
-(NSTimeInterval)intervalTime{
    return [objc_getAssociatedObject(self, "UIControl_intervalTime") doubleValue];
}
-(void)setIntervalTime:(NSTimeInterval)intervalTime{
    objc_setAssociatedObject(self, "UIControl_intervalTime", @(intervalTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/**
 图片在上边
 文字在下面
 */
-(void)refreshImgTopWith:(CGFloat)space{
    CGFloat ivW = self.imageView.frame.size.width;
    CGFloat ivH = self.imageView.frame.size.height;
    
    CGFloat titW = self.titleLabel.frame.size.width;
    CGFloat titH = self.titleLabel.frame.size.height;
    
    self.imageEdgeInsets = UIEdgeInsetsMake(-titH - space/2.0, 0, 0, -titW);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -ivW, -ivH - space/2.0, 0);
}

-(void)resetImgWith:(CGFloat)space withType:(ButtonImgPosition)type{
    
    CGFloat ivW = self.imageView.frame.size.width;
    CGFloat ivH = self.imageView.frame.size.height;
    
    CGFloat titW = self.titleLabel.frame.size.width;
    CGFloat titH = self.titleLabel.frame.size.height;
    
    switch (type) {
        case imgTop: //图片在上
            self.imageEdgeInsets = UIEdgeInsetsMake(-titH - space/2.0, 0, 0, -titW);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -ivW, -ivH - space/2.0, 0);
            break;
            
        case imgLeft: //图片在左
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
            break;
            
        case imgBottom://图片在下
            self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, -titH - space/2.0, -titW);
            self.titleEdgeInsets = UIEdgeInsetsMake(-ivH - space/2.0, -ivW, 0, 0);
            break;
            
        case imgRight://
            self.imageEdgeInsets = UIEdgeInsetsMake(0, titW + space/2.0, 0, -titW - space/2.0);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -ivW - space/2.0, 0, ivW + space/2.0);
            break;
            
        default:
            break;
    }
}


@end
