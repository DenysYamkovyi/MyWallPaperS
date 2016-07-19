//
// Created by viera on 5/6/14.
// Copyright (c) 2014 nbt. All rights reserved.
//

#import "UIImage+LoadJPG.h"


@implementation UIImage (LoadJPG)

+ (instancetype)imageWithJPGName: (NSString *)name {
    NSString *filePath = [[NSBundle mainBundle] pathForResource: name ofType: @"jpg"];
    return [UIImage imageWithContentsOfFile: filePath];
}

@end