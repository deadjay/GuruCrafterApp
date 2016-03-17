//
//  ADUniversities.h
//  
//
//  Created by Артем Алексеев on 3/11/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "ADObject.h"

@class ADCourses, ADLecturers, ADStudents;

@interface ADUniversities : ADObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *courses;
@property (nonatomic, retain) NSSet *lecturers;
@property (nonatomic, retain) NSSet *students;
@end

@interface ADUniversities (CoreDataGeneratedAccessors)

- (void)addCoursesObject:(ADCourses *)value;
- (void)removeCoursesObject:(ADCourses *)value;
- (void)addCourses:(NSSet *)values;
- (void)removeCourses:(NSSet *)values;

- (void)addLecturersObject:(ADLecturers *)value;
- (void)removeLecturersObject:(ADLecturers *)value;
- (void)addLecturers:(NSSet *)values;
- (void)removeLecturers:(NSSet *)values;

- (void)addStudentsObject:(ADStudents *)value;
- (void)removeStudentsObject:(ADStudents *)value;
- (void)addStudents:(NSSet *)values;
- (void)removeStudents:(NSSet *)values;

@end
