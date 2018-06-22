//
//  ZMCBaseRequestProtocol.h
//  ZMCommunity
//
//  Created by SeaDragon on 2018/3/13.
//请求类的协议

#import <Foundation/Foundation.h>

@class ZMCRequest;

@protocol ZMCBaseRequestProtocol <NSObject>

@required
//获取请求参数
- (NSDictionary *_Nullable)requestParamsWithRequest:(__kindof ZMCRequest *_Nonnull)request;

@end
