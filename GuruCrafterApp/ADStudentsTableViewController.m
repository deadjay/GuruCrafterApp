//
//  ADStudentsTableViewController.m
//  
//
//  Created by Артем Алексеев on 1/31/16.
//
//

#import "ADStudentsTableViewController.h"
#import "ADUniversities.h"
#import "ADStudents.h"
#import "ADDataManager.h"
#import "ADNewStudentViewController.h"

@interface ADStudentsTableViewController ()

@end

@implementation ADStudentsTableViewController

@synthesize fetchedResultsController = _fetchedResultsController;

#pragma mark - Fetched results controller

- (void) viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                      target:self
                                      action:@selector(addStudentAction)];
    
    self.navigationItem.rightBarButtonItem = addButton;
    
    
}

#pragma mark - Methods

- (void) addStudentAction {
    NSLog(@"buton ispressed");

    ADNewStudentViewController *vc = [[ADNewStudentViewController alloc] init];
    
        //[self performSegueWithIdentifier:@"presentAddNewStudent" sender:nil];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:vc];
    
    navController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self.navigationController presentViewController:navController animated:YES completion:nil];
}

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *description = [NSEntityDescription
                                        entityForName:@"ADStudents"
                                        inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:description];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *firstNameDescr = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
    NSSortDescriptor *lastNameDescr = [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
    NSArray *sortDescriptors = @[firstNameDescr, lastNameDescr];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"university == %@", self.university];
    
    [fetchRequest setPredicate:predicate];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Master"];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
    //[NSFetchedResultsController deleteCacheWithName:@"Master"]; ////???!!!!////
    
    NSError *error = nil;
    if (![self.fetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _fetchedResultsController;
}

#pragma mark - UITableViewDelegate

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    ADStudents* student = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    NSString* studentFirstName = [[[student valueForKey:@"firstName"] description] stringByAppendingString:@" "];
    
    NSString* studentFirstAndLastName = [studentFirstName
                                         stringByAppendingString:[[student valueForKey:@"lastName"] description]];
    
    cell.textLabel.text = studentFirstAndLastName;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //ADUniversities* university = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
}

@end
