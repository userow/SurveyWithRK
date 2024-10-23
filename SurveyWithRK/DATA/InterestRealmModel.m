//
//  InterestRealmModel.m
//  SurveyWithRK
//
//  Created by Pavlo Vasylenko on 23.10.2024.
//

#import "InterestRealmModel.h"
#import "SubjectRealmModel.h"

@implementation InterestRealmModel

+ (NSDictionary *)linkingObjectsProperties {
    return @{
        @"subjects": [RLMPropertyDescriptor descriptorWithClass:SubjectRealmModel.class propertyName:@"interests"],
    };
}

- (instancetype)initWithDTO:(InterestDTO *)interestDTO {
    self = [super init];
    if (self) {
        self.interestName = interestDTO.name;
    }
    return self;
}

@end
