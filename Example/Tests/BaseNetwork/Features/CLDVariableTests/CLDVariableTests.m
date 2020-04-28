//
//  ObjcCLDVariableTests.m
//
//  Copyright (c) 2018 Cloudinary (http://cloudinary.com)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

#import <XCTest/XCTest.h>
#import <Cloudinary/Cloudinary-Swift.h>

@interface ObjcCLDVariableTests : XCTestCase

@end

@implementation ObjcCLDVariableTests

CLDVariable *sut;

// MARK: - Setup and Teardown
- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
    sut = nil;
}

// MARK: - test initilization methods - empty
- (void)test_empty_init_works_correctlly {
        
    // Given
    NSString *name = [NSString new];
    
    // When
    sut = [[CLDVariable alloc] init];
    
    // Then
    XCTAssertNotNil(sut.name, "Initilized object should contain a none nil name  property");
    XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property");
    XCTAssertTrue([sut.name isEqualToString: [CLDVariable.variableNamePrefix stringByAppendingString:name]], "Name property should contain a valid prefix");
    XCTAssertTrue([sut.value isEqualToString: [NSString new]], "Initilized object should contain an empty string as value property");
    XCTAssertFalse([sut.name isEqualToString: name], "Name property should contain \"\(CLDVariable.variableNamePrefix)\" prefix");
}

// MARK: - test initilization methods - value
-(void)test_init_with_string_paramaters_works_correctlly_empty_name_paramater {
    
    // Given
    NSString *name  = [NSString new];
    NSString *value = @"alue";
    
    // When
    sut = [[CLDVariable alloc] initWithName:name stringValue:value];
    
    // Then
    XCTAssertNotNil(sut.name , "Initilized object should contain a none nil name  property");
    XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property");
    
    XCTAssertTrue([sut.name isEqualToString: [CLDVariable.variableNamePrefix stringByAppendingString:name]], "Name property should contain a valid prefix");
    XCTAssertTrue([sut.value isEqualToString: value], "Initilized object should contain an empty string as value property");
}
-(void)test_init_with_string_paramaters_works_correctlly {
    
    // Given
    NSString *name  = @"name";
    NSString *value = @"alue";
    
    // When
    sut = [[CLDVariable alloc] initWithName:name stringValue:value];

    // Then
    XCTAssertNotNil(sut.name , "Initilized object should contain a none nil name  property");
    XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property");
    
    XCTAssertTrue([sut.name isEqualToString: [CLDVariable.variableNamePrefix stringByAppendingString:name]], "Name property should have a valid prefix");
    XCTAssertTrue([sut.value isEqualToString: value], "Initilized object should contain a string as value property");
}
-(void)test_init_with_string_paramaters_with_valid_name_works_correctlly {
    
    // Given
    NSString *name  = @"$foo";
    NSString *value = @"alue";
   
    // When
    sut = [[CLDVariable alloc] initWithName:name stringValue:value];

    // Then
    XCTAssertNotNil(sut.name , "Initilized object should contain a none nil name  property");
    XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property");
    
    XCTAssertTrue([sut.name isEqualToString: name], "Initilized object should contain a string as name property");
    XCTAssertTrue([sut.value isEqualToString: value], "Initilized object should contain a string as value property");
}
-(void)test_init_with_int_paramaters_works_correctlly_empty_name_paramater {
    
    // Given
    NSString *name  = [NSString new];
    int value = 4;
    NSString* valueAsString = [@(value) stringValue];
    
    // When
    sut = [[CLDVariable alloc] initWithName:name intValue:value];
    
    // Then
    XCTAssertNotNil(sut.name , "Initilized object should contain a none nil name  property");
    XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property");
    
    XCTAssertTrue([sut.name isEqualToString: [CLDVariable.variableNamePrefix stringByAppendingString:name]], "Name property should have a valid prefix");
    XCTAssertTrue([sut.value isEqualToString: valueAsString], "Initilized object should contain a string as value property");
}
-(void)test_init_with_int_paramaters_works_correctlly {
    
    // Given
    NSString *name  = @"name";
    int value = 4;
    NSString* valueAsString = [@(value) stringValue];
    
    // When
    sut = [[CLDVariable alloc] initWithName:name intValue:value];
    
    // Then
    XCTAssertNotNil(sut.name , "Initilized object should contain a none nil name  property");
    XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property");
    
    XCTAssertTrue([sut.name isEqualToString: [CLDVariable.variableNamePrefix stringByAppendingString:name]], "Name property should have a valid prefix");
    XCTAssertTrue([sut.value isEqualToString: valueAsString], "Initilized object should contain a string as value property");
}
-(void)test_init_with_double_paramaters_works_correctlly_empty_name_paramater {
    
    // Given
    NSString *name  = [NSString new];
    double value = 3.14;
    NSString* valueAsString = [@(value) stringValue];
    
    // When
    sut = [[CLDVariable alloc] initWithName:name doubleValue:value];
    
    // Then
    XCTAssertNotNil(sut.name , "Initilized object should contain a none nil name  property");
    XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property");
    
    XCTAssertTrue([sut.name isEqualToString: [CLDVariable.variableNamePrefix stringByAppendingString:name]], "Name property should have a valid prefix");
    XCTAssertTrue([sut.value isEqualToString: valueAsString], "Initilized object should contain a string as value property");
}
-(void)test_init_with_double_paramaters_works_correctlly {
    
    // Given
    NSString *name = @"name";
    double value = 3.14;
    NSString* valueAsString = [@(value) stringValue];
    
    // When
    sut = [[CLDVariable alloc] initWithName:name doubleValue:value];
    
    // Then
    XCTAssertNotNil(sut.name , "Initilized object should contain a none nil name  property");
    XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property");
    
    XCTAssertTrue([sut.name isEqualToString: [CLDVariable.variableNamePrefix stringByAppendingString:name]], "Name property should have a valid prefix");
    XCTAssertTrue([sut.value isEqualToString: valueAsString], "Initilized object should contain a string as value property");
}

// MARK: - test initilization methods - values
-(void)test_init_with_valuesArray_works_correctlly_empty_name_paramater {
    
    // Given
    NSString *name = [NSString new];
    NSArray *values = @[];
    
    // When
    sut = [[CLDVariable alloc] initWithName:name values:values];
    
    // Then
    XCTAssertNotNil(sut.name , "Initilized object should contain a none nil name  property");
    XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property");
    
    XCTAssertTrue([sut.name isEqualToString: [CLDVariable.variableNamePrefix stringByAppendingString:name]], "Name property should have a valid prefix");
    XCTAssertTrue([sut.value isEqualToString: [NSString new]], "Initilized object should contain a string as value property");
}
-(void)test_init_with_valuesArray_works_correctlly {
    
    // Given
    NSString *name = @"name";
    NSArray *values = @[];
    
    // When
    sut = [[CLDVariable alloc] initWithName:name values:values];
    
    // Then
    XCTAssertNotNil(sut.name , "Initilized object should contain a none nil name  property");
    XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property");
    
    XCTAssertTrue([sut.name isEqualToString: [CLDVariable.variableNamePrefix stringByAppendingString:name]], "Name property should have a valid prefix");
    XCTAssertTrue([sut.value isEqualToString: [NSString new]], "Initilized object should contain a string as value property");
}
-(void)test_init_with_valuesArray_with_content_works_correctlly_single_param {
    
    // Given
    NSString *name = @"name";
    NSArray *values = @[@"my"];
    NSString *expectedResult = @"!my!";
    
    // When
    sut = [[CLDVariable alloc] initWithName:name values:values];
    
    // Then
    XCTAssertNotNil(sut.name , "Initilized object should contain a none nil name  property");
    XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property");
    
    XCTAssertTrue([sut.name isEqualToString: [CLDVariable.variableNamePrefix stringByAppendingString:name]], "Name property should have a valid prefix");
    XCTAssertTrue([sut.value isEqualToString: expectedResult], "Initilized object should contain a string as value property");
}
-(void)test_init_with_valuesArray_with_content_works_correctlly_two_param {
    
    // Given
    NSString *name = @"name";
    NSArray *values = @[@"my",@"str"];
    NSString *expectedResult = @"!my:str!";
    
    // When
    sut = [[CLDVariable alloc] initWithName:name values:values];
    
    // Then
    XCTAssertNotNil(sut.name , "Initilized object should contain a none nil name  property");
    XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property");
    
    XCTAssertTrue([sut.name isEqualToString: [CLDVariable.variableNamePrefix stringByAppendingString:name]], "Name property should have a valid prefix");
    XCTAssertTrue([sut.value isEqualToString: expectedResult], "Initilized object should contain a string as value property");
}
-(void)test_init_with_valuesArray_with_content_works_correctlly_three_param {
    
    // Given
    NSString *name = @"name";
    NSArray *values = @[@"my",@"str",@"ing"];
    NSString *expectedResult = @"!my:str:ing!";
    
    // When
    sut = [[CLDVariable alloc] initWithName:name values:values];
    
    // Then
    XCTAssertNotNil(sut.name , "Initilized object should contain a none nil name  property");
    XCTAssertNotNil(sut.value, "Initilized object should contain a none nil value property");
    
    XCTAssertTrue([sut.name isEqualToString: [CLDVariable.variableNamePrefix stringByAppendingString:name]], "Name property should have a valid prefix");
    XCTAssertTrue([sut.value isEqualToString: expectedResult], "Initilized object should contain a string as value property");
}

@end
