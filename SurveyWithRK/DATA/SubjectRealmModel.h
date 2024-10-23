//
//  SubjectRealmModel.h
//  SurveyWithRK
//
//  Created by Pavlo Vasylenko on 23.10.2024.
//

@import Foundation;
@import Realm;
#import "InterestRealmModel.h"
#import "SubjectDTO.h"

NS_ASSUME_NONNULL_BEGIN

@interface SubjectRealmModel : RLMObject

@property NSString *name;
@property NSInteger age;
@property NSString *email;
/// Nested array of interests
@property RLMArray<InterestRealmModel *><InterestRealmModel> *interests;

- (instancetype)initWithDTO:(SubjectDTO *)interestDTO;

@end
RLM_COLLECTION_TYPE(SubjectRealmModel)

NS_ASSUME_NONNULL_END
