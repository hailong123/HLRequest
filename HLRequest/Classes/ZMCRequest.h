//
//  ZMCRequest.h
//  ZMCommunity
//
//  Created by 周义进 on 09/03/2018.
//

#import "HXRequest.h"
#import "ZMCBaseRequestProtocol.h"
#import "ZMCRequestDataProcessProtocol.h"

@interface ZMCRequest : HXRequest
<
    ZMCBaseRequestProtocol,
    ZMCRequestDataProcessProtocol
>

@property (nonatomic, copy, readonly) NSDictionary *params;

@property (nonatomic, weak, nullable) id <ZMCBaseRequestProtocol> requestParamsDelegate;
@property (nonatomic, weak, nullable) id <ZMCRequestDataProcessProtocol> dataProcessDelegate;

@property (nonatomic, weak, nullable) id currentViewController;

#pragma mark - Block Method


#pragma mark - Delegate Method

- (void)sendRequest;

- (void)requestFailResponseCode:(NSInteger)responseCode
                        message:(NSString * _Nullable)message
                        request:(__kindof ZMCRequest *_Nonnull)request;

- (void)requestSuccessHandleResponse:(id _Nullable)response
                        responseCode:(NSInteger)responseCode
                             message:(NSString * _Nullable)message
                             request:(__kindof ZMCRequest *_Nonnull)request;

@end
