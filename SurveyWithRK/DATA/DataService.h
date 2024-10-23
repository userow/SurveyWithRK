//
//  DataService.h
//  SurveyWithRK
//
//  Created by Pavlo Vasylenko on 23.10.2024.
//

@import Foundation;
@class SubjectDTO;

NS_ASSUME_NONNULL_BEGIN

@interface DataService : NSObject

// Method to fetch and decode all subjects from Realm
- (NSArray<SubjectDTO *> *)fetchAllSubjects;

@end

NS_ASSUME_NONNULL_END
