//
//  HLLoginRequest.m
//  HLRequest_Example
//
//  Created by SeaDragon on 2018/5/15.
//  Copyright © 2018年 771145867@qq.com. All rights reserved.
//

#import "HLLoginRequest.h"

NSString * const ksss2 = @"dd3";
NSString * const ksss3 = @"ddd";
NSString * const ksss4 = @"ddd";
NSString * const ksss5 = @"ddd";
NSString * const ksss6 = @"ddd";
NSString * const ksss7 = @"ddd";

@implementation HLLoginRequest

- (NSString *)requestUrl {
    return @"http://120.26.11.96:8081/community/v2.0.0/user/homepage";
}

- (void)requestFailResponseCode:(NSInteger)responseCode
                        message:(NSString * _Nullable)message
                        request:(__kindof ZMCRequest * _Nonnull)request {
    
    //TODO:进行业务模型组装
    
    [self.dataProcessDelegate handleFaildRequestResponse:nil
                                               dataArray:nil
                                            responseCode:responseCode
                                                 message:message
                                          currentRequest:request];
}

- (void)requestSuccessHandleResponse:(id _Nullable)response
                        responseCode:(NSInteger)responseCode
                             message:(NSString * _Nullable)message
                             request:(__kindof ZMCRequest * _Nonnull)request {

    //TODO:进行业务模型组装
    
    [self.dataProcessDelegate handleSuccessRequestResponse:nil
                                                 dataArray:nil
                                              responseCode:responseCode
                                                   message:message
                                            currentRequest:request];
}

@end
