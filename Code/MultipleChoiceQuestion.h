//
//  MultipleChoiceQuestion.h
//  IQuestionaire
//
//  Created by Peter Friese on 15.06.11.
//  Copyright 2011 Peter Friese. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

@interface MultipleChoiceQuestion : Question

@property (nonatomic) NSUInteger minimumSelectionCount;
@property (nonatomic) NSUInteger maximumSelectionCount;

@end
