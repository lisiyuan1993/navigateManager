//
//  SQCollectionStackCell.m
//  HospitalProject
//
//  Created by 李思远 on 2017/6/14.
//  Copyright © 2017年 lsy. All rights reserved.
//
/**
 * 控制功能模块的跳转
 */
#import "SQTabbarController.h"

@interface SQTabbarController (Navigate)

/**
 *  获取MainTabbarController
 */
+ (SQTabbarController *)getMainTabbarController;

/**
 *  跳转至view controller
 *
 *  @param viewController 目标controller
 *
 */
+ (void)navigateToViewController:(UIViewController *)viewController;

@end
