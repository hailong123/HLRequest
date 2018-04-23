//
//  ZMCRequest.m
//  ZMCommunity
//
//  Created by 周义进 on 09/03/2018.
//

#import "ZMCRequest.h"

NSString *const ZMCResponseErrorKey = @"code";
NSString *const ZMCResponseDataKey = @"data";
NSString *const ZMCResponseMessageKey = @"message";


@implementation ZMCRequest

#pragma mark - Life Cycle
- (instancetype)init {
    
    if (self = [super init]) {
        
    }
    
    return self;
}

#pragma mark - System Method

#pragma mark - Public Method
- (void)preHandleRequestBusinessError:(HXRequest *)request
                         responseData:(id)responseData
                         responseCode:(NSInteger)responseCode
                              message:(NSString *)message {
    
}

- (YTKRequestSerializerType)requestSerializerType {
    return YTKRequestSerializerTypeJSON;
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

#pragma mark - Private Method

#pragma mark - Delegate

#pragma mark - Setter And Getter

#pragma mark - Dealloc

@end
