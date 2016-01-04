//
//  NetworkRequest.h
//  Recipe
//
//  Created by songbo on 15/12/23.
//  Copyright © 2015年 song. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface NetworkRequest : AFHTTPSessionManager

+ (NetworkRequest *)sharedHTTPClient;
- (id)initWithBaseURL:(NSURL *)url;

@end


@class Result;
@interface ResultInfo : NSObject

@property (nonatomic,assign)BOOL bsucces;//成功状态
@property (nonatomic,strong)NSString *reason;//中文状态
@property (nonatomic,strong)id bdata;//返回数据
@property (nonatomic,strong)NSString *bmsg;//返回数据
@property (nonatomic,strong)NSString *bcode;//返回数据

-(id)initWithDic:(NSDictionary *)dic;

@end




@class hhhhhh;
@interface baidu : NSObject

- (void)updateWeatherAtLocation:(NSString *)location forNumberOfDays:(int)number call:(void(^)(ResultInfo *info))callback;

@end