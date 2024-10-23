//
//  ApiServiceProtocol.h
//  SurveyWithRK
//
//  Created by Pavlo Vasylenko on 22.10.2024.
//

#import "SubjectDTO.h"

@protocol ApiServiceProtocol <NSObject>

- (void)sendEventWithSubject:(SubjectDTO *)subject;

@end
