//
//  SubjectDTO.h
//  Survey-ResearchKit
//
//  Created by Pavlo Vasylenko on 21.10.2024.
//

@import Foundation;
@import Mantle;
#import "InterestDTO.h"


NS_ASSUME_NONNULL_BEGIN

@interface SubjectDTO: MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSArray<InterestDTO *> *interests;

- (instancetype)initWithName:(NSString *)name
                         age:(NSInteger)age
                       email:(NSString *)email
                   interests:(NSArray<InterestDTO *> *)interests;

@end

NS_ASSUME_NONNULL_END
