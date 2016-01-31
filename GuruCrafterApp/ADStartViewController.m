//
//  ADStartViewController.m
//  
//
//  Created by Артем Алексеев on 1/31/16.
//
//

#import "ADStartViewController.h"
#import "ADStudentsTableViewController.h"

@implementation ADStartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.view.backgroundColor = [UIColor redColor];
    
}

- (IBAction)startButtonAction:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"navControllerIdentifier" sender:nil];
    
}
@end
