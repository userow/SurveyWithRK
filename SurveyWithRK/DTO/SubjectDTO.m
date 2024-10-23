//
//  SubjectDTO.m
//  Survey-ResearchKit
//
//  Created by Pavlo Vasylenko on 21.10.2024.
//

#import "SubjectDTO.h"

@implementation SubjectDTO

- (instancetype)initWithName:(NSString *)name
                         age:(NSInteger)age
                       email:(NSString *)email
                   interests:(NSArray<InterestDTO *> *)interests {
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
        _email = email;
        _interests = interests;
    }
    return self;
}

/// json mapping dictionary
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"name": @"name",
        @"age": @"age",
        @"email": @"email",
        @"interests": @"interests"
    };
}

+ (NSValueTransformer *)interestsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:InterestDTO.class];
}

@end
