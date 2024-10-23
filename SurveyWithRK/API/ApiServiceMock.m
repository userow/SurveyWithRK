//
//  ApiServiceMock.m
//  SurveyWithRK
//
//  Created by Pavlo Vasylenko on 22.10.2024.
//

#import "ApiServiceMock.h"
@import Mantle;
#import "SubjectRealmModel.h"
#import "SubjectJsonRealmModel.h"

@implementation ApiServiceMock

/// store to Realm; serialize; store JSON to Realm
- (void)sendEventWithSubject:(SubjectDTO *)subject {

    // Create an instance of SubjectRealmModel
    SubjectRealmModel *realmSubject = [[SubjectRealmModel alloc] initWithDTO:subject];

    // Store to Realm
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:realmSubject];
    }];

    NSError *error;

    NSDictionary *dictionary = [MTLJSONAdapter JSONDictionaryFromModel:subject error:&error];

    if (error) {
        NSLog(@"Error serializing to JSON: %@", error.localizedDescription);
    }

    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];

    if (!jsonData) {
        NSLog(@"Error serializing to JSON: %@", error.localizedDescription);
    } else {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"JSON: %@", jsonString);

        //Saving JSON to Realm
        SubjectJsonRealmModel *subjJsonModel = [SubjectJsonRealmModel new];
        subjJsonModel.date = NSDate.date;
        subjJsonModel.json = jsonString;

        [realm transactionWithBlock:^{
            [realm addObject:subjJsonModel];
        }];
    }
}

@end
