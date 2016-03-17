//
//  ADStudentsTableViewController.h
//  
//
//  Created by Артем Алексеев on 1/31/16.
//
//

#import <UIKit/UIKit.h>
#import "CoreDataViewController.h"
#import <CoreData/CoreData.h>

@class ADUniversities;

@interface ADStudentsTableViewController : CoreDataViewController

@property (strong, nonatomic) ADUniversities* university;

@end
