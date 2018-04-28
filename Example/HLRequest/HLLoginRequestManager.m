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
    return @"http://127.0.0.1:8880/Meet/public/phone_login";
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
    
    [self.dataProcessDelegate handleSuccessRequestResponse:response
                                                 dataArray:nil
                                              responseCode:responseCode
                                                   message:message
                                            currentRequest:request];
    
}

@end
