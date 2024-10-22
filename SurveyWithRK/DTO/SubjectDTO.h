//
//  SubjectDTO.h
//  Survey-ResearchKit
//
//  Created by Pavlo Vasylenko on 21.10.2024.
//

#import <Foundation/Foundation.h>
#import "InterestDTO.h"

NS_ASSUME_NONNULL_BEGIN

@interface SubjectDTO: NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *age;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSArray<InterestDTO *> *interests;

- (instancetype)initWithName:(NSString *)name
                         age:(NSNumber *)age
                       email:(NSString *)email
                   interests:(NSArray<InterestDTO *> *)interests;

@end

NS_ASSUME_NONNULL_END
