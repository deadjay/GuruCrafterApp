//
//  ADDataManager.m
//  
//
//  Created by Артем Алексеев on 1/31/16.
//
//

#import "ADDataManager.h"
#import "ADStudents.h"
#import "ADLecturers.h"
#import "ADCourses.h"
#import "ADUniversities.h"

@implementation ADDataManager

+ (ADDataManager*) sharedManager {
    
    static ADDataManager* manager = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        manager = [[ADDataManager alloc] init];
    });
    
    return manager;
}

#pragma mark - Names Arrays

static NSString* firstNames[] = {
    
    @"Tran", @"Lenore", @"Bud", @"Fredda", @"Katrice",
    @"Clyde", @"Hildegard", @"Vernell", @"Nellie", @"Rupert",
    @"Billie", @"Tamica", @"Crystle", @"Kandi", @"Caridad",
    @"Vanetta", @"Taylor", @"Pinkie", @"Ben", @"Rosanna",
    @"Eufemia", @"Britteny", @"Ramon", @"Jacque", @"Telma",
    @"Colton", @"Monte", @"Pam", @"Tracy", @"Tresa",
    @"Willard", @"Mireille", @"Roma", @"Elise", @"Trang",
    @"Ty", @"Pierre", @"Floyd", @"Savanna", @"Arvilla",
    @"Whitney", @"Denver", @"Norbert", @"Meghan", @"Tandra",
    @"Jenise", @"Brent", @"Elenor", @"Sha", @"Jessie"
};

static NSString* lastNames[] = {
    
    @"Farrah", @"Laviolette", @"Heal", @"Sechrest", @"Roots",
    @"Homan", @"Starns", @"Oldham", @"Yocum", @"Mancia",
    @"Prill", @"Lush", @"Piedra", @"Castenada", @"Warnock",
    @"Vanderlinden", @"Simms", @"Gilroy", @"Brann", @"Bodden",
    @"Lenz", @"Gildersleeve", @"Wimbish", @"Bello", @"Beachy",
    @"Jurado", @"William", @"Beaupre", @"Dyal", @"Doiron",
    @"Plourde", @"Bator", @"Krause", @"Odriscoll", @"Corby",
    @"Waltman", @"Michaud", @"Kobayashi", @"Sherrick", @"Woolfolk",
    @"Holladay", @"Hornback", @"Moler", @"Bowles", @"Libbey",
    @"Spano", @"Folson", @"Arguelles", @"Burke", @"Rook"
};

static NSString* lecturersFirstNames[] = {
    
    @"John", @"Luke", @"Alex", @"Steve", @"Lara",
    @"Homer", @"Peter", @"Maxim", @"Keith", @"John"
    
};

static NSString* lecturersLastNames[] = {
    
    @"Thomson", @"Jobs", @"Simpson", @"Cena", @"Abraham",
    @"Clarkson", @"Jameson", @"White", @"Gray", @"Skywalker"
    
};

#pragma mark - Methods

- (void) addAllObjects {
    
    //NSArray* universities = @[
                              [self addUniversityWithName:@"SPbGU"],
                              [self addUniversityWithName:@"KPI"],
                              [self addUniversityWithName:@"TNU"],
                              [self addUniversityWithName:@"MSU"],
                              [self addUniversityWithName:@"KNU"],
                              [self addUniversityWithName:@"KIB"];
    
    //NSArray* courses =     @[
                              [self addCourseWithName:@"iOS"],
                              [self addCourseWithName:@"Javascript"],
                              [self addCourseWithName:@"HTML"],
                              [self addCourseWithName:@"C++"],
                              [self addCourseWithName:@"Java"],
                              [self addCourseWithName:@"Python"],
                              [self addCourseWithName:@"Ruby on Rails"],
                              [self addCourseWithName:@"PHP"],
                              [self addCourseWithName:@".NET"],
                              [self addCourseWithName:@"C#"];
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription* description = [NSEntityDescription entityForName:@"ADUniversities"
                                                   inManagedObjectContext:self.managedObjectContext];
    [request setEntity:description];
    
    NSString* nameOfUniv = @"KPI";
    
    [request setPredicate:[NSPredicate predicateWithFormat:@"name == %@", nameOfUniv]];
    
    NSArray* result = [self.managedObjectContext executeFetchRequest:request
                                                               error:nil];
    
    for (ADUniversities* university in result) {
        [self addRandomStudentForUniversity:university];
        [self addRandomStudentForUniversity:university];
        [self addRandomStudentForUniversity:university];
        [self addRandomStudentForUniversity:university];
        [self addRandomStudentForUniversity:university];
        
        NSLog(@"UNIVEEEEEEERSITY NAME\n=%@", university.name);
    }
    
//НУЖНО РАЗОБРАТЬСЯ С РАЗНЫМИ ЛЕКТОРАМИ в разНЫХ СУЩНОСТЯх. ТАКЖЕ С КУРСАМИ И СТУДЕНТамИ.
    
   /* for (int i = 0; i < 50; i++) {
        
        for (ADUniversities* univ in [self allUniversities]) {
            
            [self addRandomStudentForUniversity:univ];
            
        }
        
    }*/
    
    
    
    
    for (ADCourses* course in [self allCourses]) {
        
        ADLecturers* lecturer = [self addRandomLecturer];
        course.lecturers = lecturer;
        
        
        NSLog(@"Lecturer name = %@, lastname = %@, course = %@",
              lecturer.firstName, lecturer.lastName, course.name);
    }
    
    
    for (ADUniversities* university in [self allUniversities]) {
        
        NSLog(@"Univ name = %@, univ students = %@", university.name, university.students);
        
        NSInteger number = arc4random_uniform(6) + 4;
        //NSLog(@"nu,ber = %d", number);
        while ([university.courses count] < number) {
            
            ADCourses* course = [[self allCourses] objectAtIndex:arc4random_uniform(9)];
            
            if (![university.courses containsObject:course]) {
                [university addCoursesObject:course];
                NSLog(@"UnIvErSiTy NaMe = %@. CouRsE name = %@", university.name, course.name);
            }
            
        }
        
    }
    
    [self saveMyContext];

    [self printAllObjects];
    
}

- (void) saveMyContext {
    
    if (![self.managedObjectContext save:nil]) {
        NSLog(@"error");
    }
    
    [self.managedObjectContext save:nil];
    
}

- (void) deleteAllObjects {
    
    NSArray* allObjects = [self allObjects];
    
    for (id object in allObjects) {
        [self.managedObjectContext deleteObject:object];
    }
    [self.managedObjectContext save:nil];
}

- (ADUniversities*) addUniversityWithName:(NSString*) name {
    
    ADUniversities* university = [NSEntityDescription insertNewObjectForEntityForName:@"ADUniversities"
                                                               inManagedObjectContext:self.managedObjectContext];
    university.name = name;
    
    return university;
}

- (void) addRandomStudentForUniversity:(ADUniversities*) university {
    
    ADStudents* student = [NSEntityDescription insertNewObjectForEntityForName:@"ADStudents"
                                                              inManagedObjectContext:self.managedObjectContext];
    student.averageScore = @((float)arc4random_uniform(201) / 100.f + 2.f);//это NSNumber
    student.firstName = firstNames[arc4random_uniform(50)];
    student.lastName = lastNames[arc4random_uniform(50)];
    
    [university addStudentsObject:student];
    
}

- (ADLecturers*) addRandomLecturer {
    
    ADLecturers* lecturer = [NSEntityDescription insertNewObjectForEntityForName:@"ADLecturers"
                                                          inManagedObjectContext:self.managedObjectContext];
    lecturer.firstName = lecturersFirstNames[arc4random_uniform(10)];
    lecturer.lastName = lecturersLastNames[arc4random_uniform(10)];
    
    return lecturer;
}

- (ADCourses*) addCourseWithName:(NSString*) name {
    
    ADCourses* course =
    [NSEntityDescription insertNewObjectForEntityForName:@"ADCourses"
                                  inManagedObjectContext:self.managedObjectContext];
    
    course.name = name;
    
    return course;
}

- (NSArray*) allObjects {
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription* description = [NSEntityDescription entityForName:@"ADObject"
                                                   inManagedObjectContext:self.managedObjectContext];
    [request setEntity:description];
    
    NSArray* result = [self.managedObjectContext executeFetchRequest:request
                                                               error:nil];
    return result;
    
}

- (NSArray*) allUniversities {
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription* description = [NSEntityDescription entityForName:@"ADUniversities"
                                                   inManagedObjectContext:self.managedObjectContext];
    [request setEntity:description];
    
    NSArray* result = [self.managedObjectContext executeFetchRequest:request
                                                               error:nil];
    return result;
    
}

- (NSArray*) allCourses {
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription* description = [NSEntityDescription entityForName:@"ADCourses"
                                                   inManagedObjectContext:self.managedObjectContext];
    [request setEntity:description];
    
    NSArray* result = [self.managedObjectContext executeFetchRequest:request
                                                               error:nil];
    return result;
    
}

- (void) printAllObjects {
    
    NSArray* allObjects = [self allObjects];
    
    for (id object in allObjects) {
        
        if ([object isKindOfClass:[ADStudents class]]) {
            
            ADStudents* student = (ADStudents*) object;
            NSLog(@"STUDENT: %@ %@, score = %@",
                  student.firstName, student.lastName, student.averageScore);
            
        } else if ([object isKindOfClass:[ADCourses class]]) {
            
            ADCourses* course = (ADCourses*) object;
            NSLog(@"COURSE: %@",
                  course.name);
            
        } else if ([object isKindOfClass:[ADLecturers class]]) {
            
            ADLecturers* lecturer = (ADLecturers*) object;
            NSLog(@"LECTURER: %@ %@",
                  lecturer.firstName, lecturer.lastName);
            
        } else if ([object isKindOfClass:[ADUniversities class]]) {
            
            ADUniversities* university = (ADUniversities*) object;
            NSLog(@"UNIVERSITY: %@, lecturers:%lu, courses: %lu, students: %lu",
                  university.name, [university.lecturers count],
                  [university.courses count], [university.students count]);
            
        }
        
    }
    
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "deadjay.GuruCrafterApp" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {//модель для сущностей в файле моделей
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"GuruCrafterApp" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {//запись данных из кордаты в файл
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"GuruCrafterApp.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {//контекст. работаем почти только с ним
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end

