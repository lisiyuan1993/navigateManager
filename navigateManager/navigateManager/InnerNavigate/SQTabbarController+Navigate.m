//
//  SQCollectionStackCell.m
//  HospitalProject
//
//  Created by 李思远 on 2017/6/14.
//  Copyright © 2017年 lsy. All rights reserved.
//

#import "SQTabbarController+Navigate.h"
#import "ViewControllerManager.h"
#import "SQNavigationController.h"

@implementation SQTabbarController (Navigate)

+ (SQTabbarController *)getMainTabbarController {
    id obj = [UIApplication sharedApplication].delegate.window.rootViewController;
    if ([obj isMemberOfClass:[SQTabbarController class]]) {
        return (SQTabbarController *)obj;
    }
    return nil;
}

+ (void)navigateToViewController:(UIViewController *)viewController {
    SQTabbarController *tabController = [self getMainTabbarController];
    if (!tabController) {
        tabController = [[SQTabbarController alloc] init];
        [ViewControllerManager setRootViewController:tabController];
        
        SQNavigationController *nav = tabController.viewControllers[0];
        viewController.hidesBottomBarWhenPushed = YES;
        [nav pushViewController:viewController animated:NO];
        return;
    }
    UINavigationController *nav = tabController.selectedViewController;
    viewController.hidesBottomBarWhenPushed = YES;
    [nav pushViewController:viewController animated:YES];
}

@end
