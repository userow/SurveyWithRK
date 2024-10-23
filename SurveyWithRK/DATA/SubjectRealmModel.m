//
//  SubjectRealmModel.m
//  SurveyWithRK
//
//  Created by Pavlo Vasylenko on 23.10.2024.
//

#import "SubjectRealmModel.h"

@implementation SubjectRealmModel

- (instancetype)initWithDTO:(SubjectDTO *)subjectDTO {
    self = [super init];
    if (self) {
        self.name = subjectDTO.name;
        self.age = subjectDTO.age;
        self.email = subjectDTO.email;

        // Initialize the interests array
        RLMArray<InterestRealmModel *><InterestRealmModel> *interestsArray = [[RLMArray alloc] initWithObjectClassName:@"InterestRealmModel"];

        for (InterestDTO *interest in subjectDTO.interests) {
            InterestRealmModel *interestModel = [[InterestRealmModel alloc] initWithDTO:interest];
            [interestsArray addObject:interestModel];
        }
        self.interests = interestsArray;
    }
    return self;
}

@end
