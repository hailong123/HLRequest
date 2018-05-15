//
//  HLLoginRequestManager.m
//  HLRequest_Example
//
//  Created by SeaDragon on 2018/4/23.
//  Copyright © 2018年 771145867@qq.com. All rights reserved.
//

#import "HLLoginRequestManager.h"

@implementation HLLoginRequest

- (NSString *)requestUrl {
    return @"http://192.168.6.205:8888/parentsApp/v2.1.0/index/show";
}

@end

@implementation HLLoginRequestManager

- (ZMCRequest *)requestClass {
    
    HLLoginRequest *loginRequest = [[HLLoginRequest alloc] initWithRequestWithParams:[self.requestParamsDelegate requestParamsWithRequestManager:self]];
    
    return loginRequest;
}

- (void)requestFailResponseCode:(NSInteger)responseCode
                        message:(NSString * _Nullable)message
                        request:(__kindof ZMCRequest *_Nonnull)request {
    
    //TODO:进行返回数据处理通过 response 接口返回
    [self.dataProcessDelegate handleFaildRequestResponse:nil
                                               dataArray:nil
                                            responseCode:responseCode
                                                 message:message
                                          currentRequest:request];
}

- (void)requestSuccessHandleResponse:(id _Nullable)response
                        responseCode:(NSInteger)responseCode
                             message:(NSString * _Nullable)message
                             request:(__kindof ZMCRequest *_Nonnull)request {
    
    //TODO:进行返回数据处理通过 response 接口返回
    
    [self.dataProcessDelegate handleSuccessRequestResponse:response
                                                 dataArray:nil
                                              responseCode:responseCode
                                                   message:message
                                            currentRequest:request];
    
}

@end
