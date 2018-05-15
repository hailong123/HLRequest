//
//  HXRequest.h
//  ZMParentsProject
//
//  Created by 周义进 on 08/03/2018.
//  Copyright © 2018 Sea. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>

@class HXRequest;

typedef void (^HXRequestSuccessBlock)(id _Nullable responseData, NSInteger responseCode, NSString  * _Nullable message,__kindof HXRequest * _Nonnull request);
typedef void (^HXRequestBusinessFailBlock)(id _Nullable responseData, NSInteger responseCode, NSString  * _Nullable message,__kindof HXRequest * _Nonnull request);
typedef void (^HXPRequestNetFailBlock)(NSError * _Nullable error, NSInteger netStatusCode, HXRequest * _Nonnull request);

@protocol HXRequestFinishedDelegate <NSObject>

@optional
- (void)requestSucceed:(__kindof HXRequest * _Nonnull)request
          responseData:(id _Nullable)responseData
          responseCode:(NSInteger)responseCode
               message:(NSString * _Nullable)message;

- (void)requestBusinessFail:(__kindof HXRequest * _Nonnull)request
               responseData:(id _Nullable)responseData
               responseCode:(NSInteger)responseCode
                    message:(NSString * _Nullable)message;

- (void)requestNetFail:(__kindof HXRequest * _Nonnull)request
                 error:(NSError * _Nullable)error
         netStatusCode:(NSInteger)netStatusCode;
@end

@interface HXRequest : YTKRequest

/**
 defautlt YES
 */
@property (nonatomic, assign) BOOL printRequestInfoFlag;

@property (nonatomic, assign, readonly) NSInteger businessCode;
@property (nonatomic, copy, readonly, nullable) NSString *businessMsg;

@property (nonatomic, weak, nullable) id <HXRequestFinishedDelegate> hxDelegate;

@property (nonatomic, copy, nullable) HXRequestSuccessBlock successBlock;
@property (nonatomic, copy, nullable) HXRequestBusinessFailBlock businessFailureBlock;
@property (nonatomic, copy, nullable) HXPRequestNetFailBlock netFailureBlock;

- (void)startWithCompletionBlockWithSuccess:(HXRequestSuccessBlock _Nullable)success
                               businessFail:(HXRequestBusinessFailBlock _Nullable)businessFailure
                                 netFailure:(HXPRequestNetFailBlock _Nullable)netFailure;

@end
