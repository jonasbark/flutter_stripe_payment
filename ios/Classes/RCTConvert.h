//
//  RCTConvert.h
//  Pods-Runner
//
//  Created by Jonas Bark on 06.10.19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCTConvert : NSObject

+(NSString*)NSString:(NSString*)value;
+(UIColor*)UIColor:(id)value;
+(BOOL)BOOL:(id)value;

@end

NS_ASSUME_NONNULL_END
