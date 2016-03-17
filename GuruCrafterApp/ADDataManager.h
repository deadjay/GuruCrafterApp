//
//  ADDataManager.h
//  
//
//  Created by Артем Алексеев on 1/31/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface ADDataManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

+ (ADDataManager*) sharedManager;

- (void) addAllObjects;
- (void) printAllObjects;
- (void) deleteAllObjects;

@end
