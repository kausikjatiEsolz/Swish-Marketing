//
//  Json_Class.m
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 06/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import "Json_Class.h"


@implementation Json_Class
{
    Urlresponceblock _responce;
    NSString *check;
    NSURLSessionDataTask *uploadTask;
}



-(void)GlobalDict:(NSMutableURLRequest *)parameter Globalstr:(NSString *)parametercheck Withblock:(Urlresponceblock)responce
{
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    uploadTask = [session dataTaskWithRequest:parameter completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        // Process the response
        _responce=[responce copy];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if(!error)
            {
                
                
                check=parametercheck;
                
                if([check isEqualToString:@"array"])
                {
                    
                    id result=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                    
                    _responce(result,nil);
                }
                if ([check isEqualToString:@"string"])
                {
                    id  result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                    
                    _responce(result,nil);
                }
                
            }
            else
            {
                _responce(nil,error);
                
                
                NSLog(@"error--->%@",error.localizedDescription);
                
                //[[NSNotificationCenter defaultCenter] postNotificationName:@"nointernet" object:nil];
                
                
            }
            
        });
    }];
    [uploadTask resume];
    
}

-(void)post_dataWithImage:(NSString *)url Post_data:(NSDictionary *)parameters image:(NSData *)image_Data paramNameForImage:(NSString *)paramNameForImage Withblock:(Urlresponceblock)responce
{
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:App_Domain_Url]];
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    //manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    NSLog(@"post_data--->%@",parameters);
    
    _responce=[responce copy];
    
    AFHTTPRequestOperation *op = [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData)
                                  
    {
        //do not put image inside parameters dictionary as I did, but append it!
        [formData appendPartWithFileData:image_Data name:paramNameForImage fileName:@"photo.png" mimeType:@"image/png"];
        
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"Success: %@ ***** %@", operation.responseString, responseObject);
        
        
        _responce(responseObject,nil);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
                                  
    {
       
         _responce(nil,error);
        NSLog(@"Error: %@ ***** %@", operation.responseString, error);
    
    
    }];
    [op start];
}





@end
