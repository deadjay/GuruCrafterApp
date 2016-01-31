//
//  ADStudentsTableViewController.m
//  
//
//  Created by Артем Алексеев on 1/31/16.
//
//

#import "ADStudentsTableViewController.h"

@implementation ADStudentsTableViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavController];
}

- (void) setupNavController {
    self.navigationItem.title = @"Students";
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* identifier = @"identifier";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    
    return cell;
}

@end
