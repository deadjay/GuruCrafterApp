//
//  ADCourses.h
//  
//
//  Created by Артем Алексеев on 3/11/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "ADObject.h"

@class ADLecturers, ADStudents, ADUniversities;

@interface ADCourses : ADObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) ADLecturers *lecturers;
@property (nonatomic, retain) NSSet *students;
@property (nonatomic, retain) NSSet *university;
@end

@interface ADCourses (CoreDataGeneratedAccessors)

- (void)addStudentsObject:(ADStudents *)value;
- (void)removeStudentsObject:(ADStudents *)value;
- (void)addStudents:(NSSet *)values;
- (void)removeStudents:(NSSet *)values;

- (void)addUniversityObject:(ADUniversities *)value;
- (void)removeUniversityObject:(ADUniversities *)value;
- (void)addUniversity:(NSSet *)values;
- (void)removeUniversity:(NSSet *)values;

@end
