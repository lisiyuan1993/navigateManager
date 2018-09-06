//
//  SQCollectionStackCell.m
//  HospitalProject
//
//  Created by 李思远 on 2017/6/14.
//  Copyright © 2017年 lsy. All rights reserved.
//
/**
 * 模块跳转管理类,相对于以前的集中管理，采用
 模块加载模式。
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  跳转路由配置
 */
extern NSString *const indexRoutes;//ViewController

@interface CBModuleNavigateManager : NSObject

+ (instancetype)shareInstance;

/**
 *  注册模块
 *
 *  @param identifier 可处理的标识符
 *  @param destViewController   目标view controller
 *
 */
- (void)registerIdetifier:(NSString *)identifier
           viewController:(UIViewController*(^)(NSDictionary *params))destViewController;

/**
 *  根据linkUrl跳转
 *
 *  param linkUrl
 *
 */
- (void)navigateByLinkUrl:(NSString *)linkUrl andParams:(NSDictionary *)dict;

@end
