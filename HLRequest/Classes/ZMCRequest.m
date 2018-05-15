//
//  ZMCRequest.m
//  ZMCommunity
//
//  Created by 周义进 on 09/03/2018.
//

#import "ZMCRequest.h"

NSString *const ZMCResponseDataKey    = @"data";
NSString *const ZMCResponseErrorKey   = @"code";
NSString *const ZMCResponseMessageKey = @"message";

@interface ZMCRequest ()

@property (nonatomic, copy) NSDictionary *params;

@end

@implementation ZMCRequest {
    struct {
        unsigned int ZMCRequestParamsManagerDelegate : 1;
        unsigned int ZMCRequestDataProcessProtocolFailDelegate : 1;
        unsigned int ZMCRequestDataProcessProtocolSuccessDelegate : 1;
    }_hasDes;
}

#pragma mark - Life Cycle

#pragma mark - System Method

#pragma mark - Public Method
- (void)sendRequest {
    
    self.params = [self.requestParamsDelegate requestParamsWithRequest:self];
    
    [self stop];
    
    [self startWithCompletionBlockWithSuccess:^(id  _Nullable responseData, NSInteger responseCode, NSString * _Nullable message,__kindof HXRequest * _Nonnull request) {
        [self requestSuccessHandleResponse:responseData
                              responseCode:responseCode
                                   message:message
                                   request:request];
    } businessFail:^(id  _Nullable responseData, NSInteger responseCode, NSString * _Nullable message, __kindof HXRequest * _Nonnull request) {
        [self requestFailResponseCode:responseCode
                              message:message
                              request:request];
    } netFailure:^(NSError * _Nullable error, NSInteger netStatusCode,__kindof HXRequest * _Nonnull request) {
        [self requestFailResponseCode:netStatusCode
                              message:@"网络错误"
                              request:request];
    }];
}

#pragma mark - Private Method

- (void)handleFaildRequestResponse:(id)response
                         dataArray:(NSMutableArray *)dataArray
                      responseCode:(NSInteger)responseCode
                           message:(NSString *)message
                    currentRequest:(ZMCRequest *)requeset {}

- (void)handleSuccessRequestResponse:(id)response
                           dataArray:(NSMutableArray *)dataArray
                        responseCode:(NSInteger)responseCode
                             message:(NSString *)message
                      currentRequest:(ZMCRequest *)requeset {}

- (NSDictionary *)requestParamsWithRequest:(__kindof ZMCRequest *)request {
    @throw [NSException exceptionWithName:@"方法调用异常"
                                   reason:@"此方法需子类重写"
                                 userInfo:nil];
}

- (void)requestFailResponseCode:(NSInteger)responseCode
                        message:(NSString * _Nullable)message
                        request:(__kindof ZMCRequest * _Nonnull)request {
    [[NSException exceptionWithName:@"方法调用异常"
                             reason:@"此方法需子类重写"
                           userInfo:nil] raise];
}

- (void)requestSuccessHandleResponse:(id _Nullable)response
                        responseCode:(NSInteger)responseCode
                             message:(NSString * _Nullable)message
                             request:(__kindof ZMCRequest * _Nonnull)request {
    [[NSException exceptionWithName:@"方法调用异常"
                             reason:@"此方法需子类重写"
                           userInfo:nil] raise];
}

#pragma mark Setter And Getter

- (void)setRequestParamsDelegate:(id<ZMCBaseRequestProtocol>)requestParamsDelegate {
    
    _requestParamsDelegate = requestParamsDelegate;
    
    _hasDes.ZMCRequestParamsManagerDelegate = [requestParamsDelegate respondsToSelector:@selector(requestParamsWithRequest:)];
}

- (void)setDataProcessDelegate:(id<ZMCRequestDataProcessProtocol>)dataProcessDelegate {
    
    _dataProcessDelegate = dataProcessDelegate;
    
    _hasDes.ZMCRequestDataProcessProtocolFailDelegate = [dataProcessDelegate respondsToSelector:@selector(handleFaildRequestResponse:dataArray:responseCode:message:currentRequest:)];
    _hasDes.ZMCRequestDataProcessProtocolSuccessDelegate = [dataProcessDelegate respondsToSelector:@selector(handleSuccessRequestResponse:dataArray:responseCode:message:currentRequest:)];
}

#pragma mark - Delegate

#pragma mark - Setter And Getter

- (YTKRequestSerializerType)requestSerializerType {
    return YTKRequestSerializerTypeJSON;
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (id)requestArgument {
    return self.params;
}

+ (NSDictionary *)commonHeaderFiled {
    return @{
             @"platform":@"iOS_iPhone",
             @"Api-Version":@"2.1.0"
             };
}
#pragma mark - Dealloc

@end
