//
//  LzoHelper.h
//  LzoLib
//
//  Created by 欧海川 on 2017/5/16.
//  Copyright © 2017年 cn.com.wewin.lzolib. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LzoHelper : NSObject

+(NSData *)lzo1xCompress:(NSData *)data;//压缩数据
+(NSData *)lzo1xDeCompress:(NSData *)data newLength:(long)length;//解压缩数据

@end
