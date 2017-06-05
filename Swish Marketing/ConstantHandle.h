//
//  ConstantHandle.h
//  Instagram_Login
//
//  Created by Rahul Singha Roy on 04/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#ifndef ConstantHandler_h
#define ConstantHandler_h

//set User authentication and url
#define INSTAGRAM_AUTHURL @"https://api.instagram.com/oauth/authorize/"
#define INSTAGRAM_APIURl  @"https://api.instagram.com/v1/users/"
#define INSTAGRAM_CLIENT_ID @"c8fc752d79b04ce2ab5f563c110706ee"
#define INSTAGRAM_CLIENTSERCRET @"9fe4fea7ea29434394109d681eed2d02"
#define INSTAGRAM_REDIRECT_URL  @"http://esolz.co.in/"
#define INSTAGRAM_ACCESS_TOKEN  @"access_token"
#define INSTAGRAM_SCOPE         @"likes+comments+relationships+follower_list+public_content"

//Contant Url
#define ACCESS_TOKEN    @"#access_token="
#define UNSIGNED        @"UNSIGNED"
#define CODE            @"code="
#define END_POINT_URL   @"https://api.instagram.com/oauth/access_token"
#define HTTP_METHOD     @"POST"
#define CONTENT_LENGTH  @"Content-Length"
#define REQUEST_DATA    @"application/x-www-form-urlencoded"
#define CONTENT_TYPE    @"Content-Type"

//share Photo Constant
#define DOCUMENT_FILE_PATH @"Documents/originalImage.ig"
#define APP_URL   @"instagram://app"
#define UTI_URL   @"com.instagram.exclusivegram"
#define MESSAGE   @"Instagram not installed in this device!\nTo share image please install instagram."

#endif /* ConstantHandler_h */
