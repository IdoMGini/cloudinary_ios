//
//  NetworkBaseTestObjc1.h
//  Cloudinary_Tests
//
//  Created by Oz Deutsch on 28/06/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Cloudinary/Cloudinary-Swift.h>
#import "Cloudinary_Tests-Swift.h"

@interface NetworkBaseTestObjc : XCTestCase
@property (nonatomic, strong, nullable) CLDCloudinary* cloudinary;
@property (nonatomic, assign) NSTimeInterval timeInterval;
@end
