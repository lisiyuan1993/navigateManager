//
//  SQCollectionStackCell.m
//  HospitalProject
//
//  Created by 李思远 on 2017/6/14.
//  Copyright © 2017年 lsy. All rights reserved.
//

#import "CBModuleNavigateManager.h"
#import "ViewController.h"

NSString *const indexRoutes = @"indexRoutes";

#pragma mark - 跳转处理

@interface CBModuleNavigateModel : NSObject

@property (copy, nonatomic) NSString *identifier;
@property (copy, nonatomic) UIViewController*(^viewControllerBlock)(NSDictionary *params);

@end

@implementation CBModuleNavigateModel

@end

#pragma mark - 跳转url解析对象

@interface CBInnerNavigateModel : NSObject

/**
 *  跳转标识符
 */
@property (nonatomic, copy) NSString *identifier;

@end

@implementation CBInnerNavigateModel

@end

#pragma mark - 跳转manager

@interface CBModuleNavigateManager ()

@property (nonatomic, strong) NSMutableDictionary *map;

@property (nonatomic, strong) NSMutableArray *booksArr;
@end

@implementation CBModuleNavigateManager

//TODO:
+ (instancetype)shareInstance {
    static CBModuleNavigateManager *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(shareInstance == nil){
            shareInstance = [[CBModuleNavigateManager alloc] init];
        }
        //首页
        [shareInstance registerIdetifier:indexRoutes viewController:^UIViewController *(NSDictionary *params) {
            ViewController *vc = [[ViewController alloc] init];
            return vc;
        }];
        
    });
    return shareInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.map = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)registerIdetifier:(NSString *)identifier viewController:(UIViewController*(^)(NSDictionary *params))destViewController {
    CBModuleNavigateModel *model = [[CBModuleNavigateModel alloc] init];
    model.identifier = identifier;
    model.viewControllerBlock = destViewController;
    [self.map setValue:model forKey:identifier];
}

- (void)navigateByLinkUrl:(NSString *)linkUrl andParams:(NSDictionary *)dict {
    if (!linkUrl || [linkUrl isEqualToString:@""]) {
        return;
    }
    CBModuleNavigateModel *blockModel = self.map[linkUrl];
    if (!blockModel) {
        return;
    }
    UIViewController *viewController = blockModel.viewControllerBlock(dict);
    if (!viewController) {
        return;
    }
    [SQTabbarController navigateToViewController:viewController];
}

@end
