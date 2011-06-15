//
//  QuestionTests.m
//  IQuestionaire
//
//  Created by Peter Friese on 15.06.11.
//  Copyright 2011 itemis. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>

#import "Option.h"
#import "Question.h"
#import "MultipleChoiceQuestion.h"

@interface QuestionTests : SenTestCase
@end

@implementation QuestionTests

- (void)testSimpleQuestion {
    Question *q = [[Question alloc] init];
    [q setKey:@"fortytwo"];
    [q setSubtitle:@"The final question"];
    [q setTitle:@"What's the answer to the question of all questions?"];
    
    STAssertEquals(@"fortytwo", [q key], nil);
    STAssertEquals(@"The final question", [q subtitle], nil);
    STAssertEquals(@"What's the answer to the question of all questions?", [q title], nil);
    STAssertNil([q nextQuestion], nil);
}

- (void)testStateDependentValidation {
    MultipleChoiceQuestion *q = [[MultipleChoiceQuestion alloc] init];
    [q setMinimumSelectionCount:1];
    
    Option *o1 = [[Option alloc] init];
    [o1 setChecked:NO];
    Option *o2 = [[Option alloc] init];
    [o2 setChecked:NO];
    [q setOptions:[NSArray arrayWithObjects:o1, o2, nil]];
    STAssertEquals((NSUInteger) 2, [[q options] count], nil);
    
    STAssertFalse([q valid], nil);
    
    [o2 setChecked:YES];
    STAssertTrue([q valid], nil);
}

@end
