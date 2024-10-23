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

//// Overriding the description method to provide a custom string representation
//- (NSString *)description {
//    return [NSString stringWithFormat:@"SubjectDTO: { name: %@, age: %@ , email: %@, interests: [\n%@] }", 
//            self.name,
//            self.age,
//            self.email,
//            self.interests];
//}

/// json mapping dictionary
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"name": @"name",
        @"age": @"age",
        @"email": @"email",
        @"interests": @"interests"
    };
}

@end
