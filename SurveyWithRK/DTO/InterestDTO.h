//
//  InterestDTO.h
//  Survey-ResearchKit
//
//  Created by Pavlo Vasylenko on 21.10.2024.
//

#import <Foundation/Foundation.h>
@import Mantle;

NS_ASSUME_NONNULL_BEGIN

@interface InterestDTO : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *name;

- (instancetype)initWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
