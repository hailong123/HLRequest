//
//  ZMCRequestDataProcessProtocol.h
//  ZMCommunity
//
//  Created by SeaDragon on 2018/3/16.
//数据处理协议

#import <Foundation/Foundation.h>

@class HXRequest;

@protocol ZMCRequestDataProcessProtocol <NSObject>

@required
//基类协议 (获取成功的数据)
- (void)handleSuccessRequestResponse:(id _Nullable )response
                           dataArray:(NSMutableArray * _Nullable)dataArray
                        responseCode:(NSInteger)responseCode
                             message:(NSString * _Nullable)message
                      currentRequest:(HXRequest *_Nonnull)requeset;

//基类协议 (获取失败的数据)
- (void)handleFaildRequestResponse:(id _Nullable )response
                         dataArray:(NSMutableArray * _Nullable)dataArray
                     responseCode:(NSInteger)responseCode
                          message:(NSString * _Nullable)message
                   currentRequest:(HXRequest *_Nonnull)requeset;

@end
