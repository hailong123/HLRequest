//
//  ZMCRequest.h
//  ZMCommunity
//
//  Created by 周义进 on 09/03/2018.
//

#import "HXRequest.h"

#define ZMCStartRequest(ZMCREQUEST) [ZMCREQUEST startWithCompletionBlockWithSuccess:^(id  _Nullable responseData, NSInteger responseCode, NSString * _Nullable message, HXRequest * _Nonnull request) { \
if (successHandler) { \
successHandler(responseData, responseCode, message); \
}\
} businessFail:^(id  _Nullable responseData, NSInteger responseCode, NSString * _Nullable message, HXRequest * _Nonnull request) {\
if (businessFailHandler) {\
businessFailHandler(responseData, responseCode, message);\
}\
} netFailure:^(NSError * _Nullable error, NSInteger netStatusCode, HXRequest * _Nonnull request) {\
if (netFailHandler) {\
netFailHandler(error, netStatusCode);\
}\
}];

typedef NS_ENUM(NSInteger, ZMCRequestResponseCodeType)
{
    ZMCRequestResponseCodeTypeError          = -1,
    ZMCRequestResponseCodeTypeSuccess        = 0,
    ZMCRequestResponseCodeTypeInvalidSession = 11,
    ZMCRequestResponseCodeTypeForcedUpdate   = 12,
};



FOUNDATION_EXTERN NSString *const ZMCResponseErrorKey;
FOUNDATION_EXTERN NSString *const ZMCResponseDataKey;
FOUNDATION_EXTERN NSString *const ZMCResponseMessageKey;

@interface ZMCRequest : HXRequest

@property (nonatomic, copy) NSDictionary *params;

- (instancetype)initWithRequestWithParams:(NSDictionary *)params;

@end
