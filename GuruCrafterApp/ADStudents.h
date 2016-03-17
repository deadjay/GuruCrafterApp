//
//  ADStudents.h
//  
//
//  Created by Артем Алексеев on 3/11/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "ADObject.h"

@class ADCourses, ADUniversities;

@interface ADStudents : ADObject

@property (nonatomic, retain) NSNumber * averageScore;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSSet *courses;
@property (nonatomic, retain) ADUniversities *university;
@end

@interface ADStudents (CoreDataGeneratedAccessors)

- (void)addCoursesObject:(ADCourses *)value;
- (void)removeCoursesObject:(ADCourses *)value;
- (void)addCourses:(NSSet *)values;
- (void)removeCourses:(NSSet *)values;

@end
