//
//  SubjectDTO.m
//  Survey-ResearchKit
//
//  Created by Pavlo Vasylenko on 21.10.2024.
//

#import "SubjectDTO.h"

@implementation SubjectDTO

- (instancetype)initWithName:(NSString *)name
                         age:(NSNumber *)age
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

@end
