//
//  NetworkRequest.m
//  Recipe
//
//  Created by songbo on 15/12/23.
//  Copyright © 2015年 song. All rights reserved.
//

#import "NetworkRequest.h"

@implementation NetworkRequest
+ (NetworkRequest *)sharedHTTPClient {
   
    NSString *urlStr = @"http://v.juhe.cn";
    
    static dispatch_once_t pred;
    static NetworkRequest *_sharedHTTPClient = nil;
    
    dispatch_once(&pred, ^{ _sharedHTTPClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:urlStr]]; });
    return _sharedHTTPClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    return self;
}

@end



@implementation ResultInfo
-(id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
//        self.bcode = [dic objectForKey:@"code"];
        self.bdata = [dic objectForKey:@"result"];
        self.bsucces = [[dic objectForKey:@"error_code"]integerValue]==0;
//        self.bmsg = [dic objectForKey:@"msg"];
        
    }
    return self;
}
@end



@implementation baidu

- (void)updateWeatherAtLocation:(NSString *)location forNumberOfDays:(int)number call:(void(^)(ResultInfo *info))callback{
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:@"857b1f914c4d002a30683c3ecd0391fb" forKey:@"key"];
    
    [[NetworkRequest sharedHTTPClient] GET:@"/weather/uni" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        ResultInfo *res = [[ResultInfo alloc]initWithDic:responseObject];
        if (res.bsucces) {
         
            callback(res);
       
        }else{
           
            callback(res);
       
        }

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        ResultInfo *res = [[ResultInfo alloc]init];
        res.bsucces = NO;
        res.bmsg = error.description;
        callback(res);

    }];
    
    
}

@end
