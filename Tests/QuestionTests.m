//
//  QuestionTests.m
//  IQuestionaire
//
//  Created by Peter Friese on 15.06.11.
//  Copyright 2011 Peter Friese. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>

#import "Option.h"
#import "Question.h"
#import "SingleChoiceQuestion.h"
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
    STAssertTrue([q valid], nil);
}

- (void)testSingleChoiceQuestion {
    SingleChoiceQuestion *q = [[SingleChoiceQuestion alloc] init];
    [q setKey:@"singlechoice"];
    [q setTitle:@"Choose either one"];
    Option *o1 = [[Option alloc] init];
    [o1 setKey:@"one"];
    [o1 setTitle:@"One"];
    Option *o2 = [[Option alloc] init];
    [o2 setKey:@"two"];
    [o2 setTitle:@"Two"];
    [q setOptions:[NSArray arrayWithObjects:o1, o2, nil]];
    STAssertEquals((NSUInteger) 2, [[q options] count], nil);
    
    // single choice question is only valid if exactly one option is selected
    
    // nothing selected:
    STAssertFalse([q valid], nil);
    
    // one option selected:
    [o2 setChecked:YES];
    STAssertTrue([q valid], nil);
    
    // two options selected:
    [o1 setChecked:YES];
    STAssertFalse([q valid], nil);
}

- (void)testMultipleChoiceQuestion {
    MultipleChoiceQuestion *q = [[MultipleChoiceQuestion alloc] init];
    
    Option *o1 = [[Option alloc] init];
    [o1 setChecked:NO];
    Option *o2 = [[Option alloc] init];
    [o2 setChecked:NO];
    [q setOptions:[NSArray arrayWithObjects:o1, o2, nil]];
    STAssertEquals((NSUInteger) 2, [[q options] count], nil);
    
    // no matter how many options are checked, a multiplechoice question is always valid
    
    // nothing selected:
    STAssertTrue([q valid], nil);
    
    // one option checked:
    [o2 setChecked:YES];
    STAssertTrue([q valid], nil);
    
    // two options checked:
    [o1 setChecked:YES];
    STAssertTrue([q valid], nil);
}

@end
