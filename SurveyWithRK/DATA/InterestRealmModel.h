//
//  InterestRealmModel.h
//  SurveyWithRK
//
//  Created by Pavlo Vasylenko on 23.10.2024.
//

@import Foundation;
@import Realm;
#import "InterestDTO.h"

NS_ASSUME_NONNULL_BEGIN

@interface InterestRealmModel : RLMObject
@property (readonly) RLMLinkingObjects *subjects;

/// Property for interest name
@property NSString *interestName;

- (instancetype)initWithDTO:(InterestDTO *)interestDTO;

@end
RLM_COLLECTION_TYPE(InterestRealmModel)

NS_ASSUME_NONNULL_END
