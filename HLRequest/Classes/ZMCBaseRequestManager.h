//
//  ZMCBaseRequestManager.h
//  ZMCommunity
//
//  Created by SeaDragon on 2018/3/13.
//请求处理基类

#import <Foundation/Foundation.h>

#import "HXRequest.h"
#import "ZMCBaseRequestProtocol.h"
#import "ZMCRequestDataProcessProtocol.h"

@interface ZMCBaseRequestManager : NSObject
<
    ZMCBaseRequestProtocol,
    ZMCRequestDataProcessProtocol
>

@property (nonatomic, weak, nullable) id <ZMCBaseRequestProtocol> requestParamsDelegate;
@property (nonatomic, weak, nullable) id <ZMCRequestDataProcessProtocol> dataProcessDelegate;

@property (nonatomic, strong, nullable) HXRequest* currentRequest;

@property (nonatomic, weak, nullable) id currentViewController;

- (void)sendRequest;

- (void)requestFailResponseCode:(NSInteger)responseCode
                        message:(NSString * _Nullable)message
                        request:(__kindof HXRequest *_Nonnull)request;

- (void)requestSuccessHandleResponse:(id _Nullable)response
                        responseCode:(NSInteger)responseCode
                             message:(NSString * _Nullable)message
                             request:(__kindof HXRequest *_Nonnull)request;

@end
