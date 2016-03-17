//
//  ADLecturers.h
//  
//
//  Created by Артем Алексеев on 3/11/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "ADObject.h"

@class ADCourses, ADUniversities;

@interface ADLecturers : ADObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) ADCourses *courses;
@property (nonatomic, retain) ADUniversities *university;

@end
