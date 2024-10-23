//
//  InterestDTO.m
//  Survey-ResearchKit
//
//  Created by Pavlo Vasylenko on 21.10.2024.
//

#import "InterestDTO.h"

@implementation InterestDTO

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = name;
    }
    return self;
}

/// json mapping dictionary
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"name": @"name"
    };
}

@end
