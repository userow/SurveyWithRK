//
//  DataService.m
//  SurveyWithRK
//
//  Created by Pavlo Vasylenko on 23.10.2024.
//


@import Realm;
@import Mantle;

#import "DataService.h"
#import "SubjectJsonRealmModel.h"
#import "SubjectDTO.h"

@implementation DataService

// Fetch and decode all subjects from Realm
- (NSArray<SubjectDTO *> *)fetchAllSubjects {
    NSMutableArray<SubjectDTO *> *subjects = [NSMutableArray array];

    // Fetch all SubjectJsonRealmModel objects from Realm
    RLMResults<SubjectJsonRealmModel *> *results = [SubjectJsonRealmModel allObjects];

    for (SubjectJsonRealmModel *jsonModel in results) {
        if (jsonModel.json) {
            // Decode the JSON string into a SubjectDTO object
            NSData *jsonData = [jsonModel.json dataUsingEncoding:NSUTF8StringEncoding];
            NSError *jsonError;
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&jsonError];

            if (jsonError) {
                NSLog(@"Error decoding JSON: %@", jsonError.localizedDescription);
                continue;
            }

            NSError *mantleError;
            SubjectDTO *subjectDTO = [MTLJSONAdapter modelOfClass:SubjectDTO.class fromJSONDictionary:jsonDict error:&mantleError];

            if (mantleError) {
                NSLog(@"Error decoding SubjectDTO with Mantle: %@", mantleError.localizedDescription);
                continue;
            }

            [subjects addObject:subjectDTO];
        }
    }

    return [subjects copy];
}

@end
