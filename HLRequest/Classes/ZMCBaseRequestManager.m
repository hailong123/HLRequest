//
//  ZMCBaseRequestManager.m
//  ZMCommunity
//
//  Created by SeaDragon on 2018/3/13.
//

#import "ZMCBaseRequestManager.h"

#import "ZMCRequest.h"

@interface ZMCBaseRequestManager ()

@end

@implementation ZMCBaseRequestManager {
    struct {
        unsigned int ZMCRequestParamsManagerDelegate : 1;
        unsigned int ZMCRequestDataProcessProtocolFailDelegate : 1;
        unsigned int ZMCRequestDataProcessProtocolSuccessDelegate : 1;
    }_hasDes;
}

- (void)sendRequest {

    self.currentRequest = [self requestClass];
    
    [self.currentRequest stop];
    
    [self.currentRequest startWithCompletionBlockWithSuccess:^(id  _Nullable responseData, NSInteger responseCode, NSString * _Nullable message, HXRequest * _Nonnull request) {
        [self requestSuccessHandleResponse:responseData
                              responseCode:responseCode
                                   message:message
                                   request:request];
    } businessFail:^(id  _Nullable responseData, NSInteger responseCode, NSString * _Nullable message, HXRequest * _Nonnull request) {
        [self requestFailResponseCode:responseCode
                              message:message
                              request:request];
    } netFailure:^(NSError * _Nullable error, NSInteger netStatusCode, HXRequest * _Nonnull request) {
        [self requestFailResponseCode:netStatusCode
                              message:@"网络错误"
                              request:request];
    }];
    
}

#pragma mark ZMCBaseRequestProtocol

- (__kindof ZMCRequest *)requestClass {
    
    [[NSException exceptionWithName:@"方法调用异常"
                             reason:@"此方法需子类重写"
                           userInfo:nil] raise];
    
    return nil;
}

- (NSDictionary * _Nullable)requestParamsWithRequestManager:(id)requestManager {return nil;}

- (void)handleFaildRequestResponse:(id)response
                         dataArray:(NSMutableArray *)dataArray
                      responseCode:(NSInteger)responseCode
                           message:(NSString *)message
                    currentRequest:(HXRequest *)requeset {}

- (void)handleSuccessRequestResponse:(id)response
                           dataArray:(NSMutableArray *)dataArray
                        responseCode:(NSInteger)responseCode
                             message:(NSString *)message
                      currentRequest:(HXRequest *)requeset {}

- (void)requestFailResponseCode:(NSInteger)responseCode
                        message:(NSString * _Nullable)message
                        request:(__kindof HXRequest * _Nonnull)request {
    [[NSException exceptionWithName:@"方法调用异常"
                             reason:@"此方法需子类重写"
                           userInfo:nil] raise];
}

- (void)requestSuccessHandleResponse:(id _Nullable)response
                        responseCode:(NSInteger)responseCode
                             message:(NSString * _Nullable)message
                             request:(__kindof HXRequest * _Nonnull)request {
    [[NSException exceptionWithName:@"方法调用异常"
                             reason:@"此方法需子类重写"
                           userInfo:nil] raise];
}

#pragma mark Setter And Getter
- (void)setRequestParamsDelegate:(id<ZMCBaseRequestProtocol>)requestParamsDelegate {
    
    _requestParamsDelegate = requestParamsDelegate;
    
     _hasDes.ZMCRequestParamsManagerDelegate = [requestParamsDelegate respondsToSelector:@selector(requestParamsWithRequestManager:)];
}

- (void)setDataProcessDelegate:(id<ZMCRequestDataProcessProtocol>)dataProcessDelegate {
    
    _dataProcessDelegate = dataProcessDelegate;
    
    _hasDes.ZMCRequestDataProcessProtocolFailDelegate = [dataProcessDelegate respondsToSelector:@selector(handleFaildRequestResponse:dataArray:responseCode:message:currentRequest:)];
    _hasDes.ZMCRequestDataProcessProtocolSuccessDelegate = [dataProcessDelegate respondsToSelector:@selector(handleSuccessRequestResponse:dataArray:responseCode:message:currentRequest:)];
}

@end
