//
//  RCTConvert.m
//  Pods-Runner
//
//  Created by Jonas Bark on 06.10.19.
//

#import "RCTConvert.h"

@implementation RCTConvert

+(NSString*)NSString:(id)value {
    return value;
}
+(UIColor*)UIColor:(id)value {
    return UIColor.blueColor;
}
+(BOOL)BOOL:(id)value {
    return value;
}

@end
