//
//  HXRequest.m
//  ZMParentsProject
//
//  Created by 周义进 on 08/03/2018.
//  Copyright © 2018 Sea. All rights reserved.
//

#import "HXRequest.h"

@interface HXRequest()<YTKRequestDelegate>
@property (nonatomic, strong) NSDate *requestimeBeginTime;
@property (nonatomic, assign) NSTimeInterval requesCostTime;
@end

@implementation HXRequest

#pragma mark - Life Cycle
- (instancetype)init {
    if (self = [super init]) {
        self.printRequestInfoFlag = YES;
    }
    return self;
}

#pragma mark - System Method

#pragma mark - Public Method
- (void)startWithCompletionBlockWithSuccess:(HXRequestSuccessBlock)success businessFail:(HXRequestBusinessFailBlock)businessFailure netFailure:(HXPRequestNetFailBlock)netFailure {
    self.successBlock         = success;
    self.businessFailureBlock = businessFailure;
    self.netFailureBlock      = netFailure;
    [self start];
}

- (void)start {
    self.delegate = self;
    self.requestimeBeginTime = [NSDate date];
    [super start];
}

- (void)clearCompletionBlock {
    [super clearCompletionBlock];
    self.successBlock         = nil;
    self.businessFailureBlock = nil;
    self.netFailureBlock      = nil;
}

- (void)preHandleRequestBusinessError:(HXRequest *)request responseData:(id)responseData responseCode:(NSInteger)responseCode message:(NSString *)message {
    
}

#pragma mark - Private Method
- (void)printRequestInfo {
    if (self.printRequestInfoFlag) {
        NSLog(@"requestCost:%@(ms) \n requestInfo:%@ \nresponse:%@", @(self.requesCostTime), [self description], self.responseObject);
    }
}

- (void)handleRequest:(HXRequest *)request result:(BOOL)success {
    
    self.requesCostTime = [[NSDate date] timeIntervalSinceDate:self.requestimeBeginTime];
    [self printRequestInfo];
    
    
    if (success) {//request success
        [self parserSuccessRequest:request];
    }
    else { //request fail because of netfail
        
        if (self.netFailureBlock) {
            self.netFailureBlock(request.error, request.responseStatusCode, self);
            
        }
        if ([self.hxDelegate respondsToSelector:@selector(requestNetFail:error:netStatusCode:)]) {
            [self.hxDelegate requestNetFail:self error:request.error netStatusCode:request.responseStatusCode];
        }
    }
    
    
    [self clearCompletionBlock];
}

- (void)preHandleBusinessErrorResponseWithCode:(NSInteger)code {
    if (code == 11) { //need login
        _businessMsg = nil;
    }
}

- (void)parserSuccessRequest:(HXRequest *)request {
    //parser
    id responseData = [request.responseJSONObject objectForKey:self.responseDataKey];

    //检测服务器数据是否合法
    BOOL requestValid = request.responseJSONObject && ![request.responseJSONObject isKindOfClass:[NSNull class]] && ![request.responseJSONObject isKindOfClass:[NSString class]];
    
    if (requestValid) {
        _businessCode = [[request.responseJSONObject objectForKey:self.responseCodeKey] integerValue];
        _businessMsg  = [request.responseJSONObject objectForKey:self.responseMsgKey];
    } else {
        _businessMsg  = @"服务器数据异常,无法解析";
        _businessCode = -1;
    }
    
    if (self.businessCode == self.successCodeValue) {
        
        if (self.successBlock) {
            self.successBlock(responseData, self.businessCode, self.businessMsg, self);
        }
        //delegate
        if ([self.hxDelegate respondsToSelector:@selector(requestSucceed:responseData: responseCode:message:)]) {
            [self.hxDelegate requestSucceed:self responseData:responseData responseCode:self.businessCode message:self.businessMsg];
        }
        
    } else {
        
        [self preHandleBusinessErrorResponseWithCode:self.businessCode];
        
        //block
        if (self.businessFailureBlock) {
            self.businessFailureBlock(responseData, self.businessCode, self.businessMsg, self);
            
        }
        
        if ([self.hxDelegate respondsToSelector:@selector(requestBusinessFail:responseData:responseCode:message:)]) {
            [self.hxDelegate requestBusinessFail:self responseData:responseData responseCode:self.businessCode message:self.businessMsg];
        }
        
    }
}

#pragma mark - Delegate
#pragma mark YTKRequestDelegate
- (void)requestFinished:(HXRequest *)request {
    [self handleRequest:request result:YES];
}

- (void)requestFailed:(HXRequest *)request {
    [self handleRequest:request result:NO];
}

#pragma mark - Setter And Getter


#pragma mark Config
- (NSString *)responseMsgKey {
    if (!_responseMsgKey) {
        _responseMsgKey = @"message";
    }
    return _responseMsgKey;
}

- (NSString *)responseCodeKey {
    if (!_responseCodeKey) {
        _responseCodeKey = @"code";
    }
    return _responseCodeKey;
}

- (NSString *)responseDataKey {
    if (!_responseDataKey) {
        _responseDataKey = @"data";
    }
    return _responseDataKey;
}

#pragma mark - Dealloc

@end
