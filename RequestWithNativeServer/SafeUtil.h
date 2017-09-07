//
//  SafeUtil.h
//  RequestWithNativeServer
//
//  Created by 高天翔 on 2017/9/7.
//  Copyright © 2017年 chunyu. All rights reserved.
//

#ifndef SafeUtil_h
#define SafeUtil_h

#define safe_block(block, ...) block ? block(__VA_ARGS__) : nil

#endif /* SafeUtil_h */
