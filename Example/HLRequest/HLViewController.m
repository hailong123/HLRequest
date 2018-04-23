//
//  HLViewController.m
//  HLRequest
//
//  Created by 771145867@qq.com on 04/23/2018.
//  Copyright (c) 2018 771145867@qq.com. All rights reserved.
//

#import "HLViewController.h"

#import "HLLoginRequestManager.h"

@interface HLViewController ()
<
    ZMCBaseRequestProtocol,
    ZMCRequestDataProcessProtocol
>

@property (nonatomic, strong) HLLoginRequestManager *loginRequestManager;

@end

@implementation HLViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Private Method

#pragma mark - Public Method

#pragma mark - Delegate
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.loginRequestManager sendRequest];
}

#pragma mark ZMCBaseRequestProtocol
- (NSDictionary *)requestParamsWithRequestManager:(__kindof ZMCBaseRequestManager *)requestManager {
    if ([requestManager isKindOfClass:[HLLoginRequestManager class]]) {
        return @{
                 @"userID":@(1),
                 @"name":@"哈哈"
                 };
    }
    
    return nil;
}

#pragma ZMCRequestDataProcessProtocol
- (void)handleSuccessRequestResponse:(id)response
                           dataArray:(NSMutableArray *)dataArray
                        responseCode:(NSInteger)responseCode
                             message:(NSString *)message
                      currentRequest:(ZMCRequest *)requeset {
    if ([requeset isKindOfClass:[HLLoginRequest class]]) {
        NSLog(@"*********  请求成功! *********");
    }
}

- (void)handleFaildRequestResponse:(id)response
                         dataArray:(NSMutableArray *)dataArray
                      responseCode:(NSInteger)responseCode
                           message:(NSString *)message
                    currentRequest:(ZMCRequest *)requeset {
    if ([requeset isKindOfClass:[HLLoginRequest class]]) {
        NSLog(@"***********  请求失败 *********");
    }
}

#pragma mark - Setter And Getter

- (HLLoginRequestManager *)loginRequestManager {
    if (!_loginRequestManager) {
        _loginRequestManager = [[HLLoginRequestManager alloc] init];
        _loginRequestManager.dataProcessDelegate   = self;
        _loginRequestManager.requestParamsDelegate = self;
        _loginRequestManager.currentViewController = self;
    }
    
    return _loginRequestManager;
}

#pragma mark - Delloc

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
