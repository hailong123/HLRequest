//
//  ZMCBaseRequestProtocol.h
//  ZMCommunity
//
//  Created by SeaDragon on 2018/3/13.
//请求类的协议

#import <Foundation/Foundation.h>

@class ZMCRequest;
@class ZMCBaseRequestManager;

@protocol ZMCBaseRequestProtocol <NSObject>

@optional
//指定请求类
- (ZMCRequest *_Nonnull)requestClass;

@required
//获取请求参数
- (NSDictionary *_Nullable)requestParamsWithRequestManager:(__kindof ZMCBaseRequestManager *_Nonnull)requestManager;

@end
