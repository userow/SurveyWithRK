//
//  SubjectJsonRealmModel.h
//  SurveyWithRK
//
//  Created by Pavlo Vasylenko on 23.10.2024.
//

@import Foundation;
@import Realm;

NS_ASSUME_NONNULL_BEGIN

@interface SubjectJsonRealmModel : RLMObject

@property NSDate *date;
@property NSString *json;

@end

NS_ASSUME_NONNULL_END
