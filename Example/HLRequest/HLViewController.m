//
//  HLViewController.m
//  HLRequest
//
//  Created by 771145867@qq.com on 04/23/2018.
//  Copyright (c) 2018 771145867@qq.com. All rights reserved.
//

#import "HLViewController.h"

#import "HLLoginRequest.h"

@interface HLViewController ()
<
    ZMCBaseRequestProtocol,
    ZMCRequestDataProcessProtocol
>

@property (nonatomic, strong) HLLoginRequest *loginRequest;

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
    [self.loginRequest sendRequest];
}

#pragma mark ZMCBaseRequestProtocol
- (NSDictionary *)requestParamsWithRequest:(__kindof ZMCRequest *)request {

    //TODO:进行参数配置
    if ([request isKindOfClass:[HLLoginRequest class]]) {
        return @{ksss2:@"33333"};
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
- (HLLoginRequest *)loginRequest {

    if (!_loginRequest) {
        _loginRequest = [[HLLoginRequest alloc] init];
        _loginRequest.requestParamsDelegate = self;
        _loginRequest.dataProcessDelegate   = self;
    }
    
    return _loginRequest;
}

#pragma mark - Delloc

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
