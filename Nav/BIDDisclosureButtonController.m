//
//  BIDDisclosureButtonController.m
//  Nav
//
//  Created by koly on 12/23/12.
//  Copyright (c) 2012 koly. All rights reserved.
//

#import "BIDDisclosureButtonController.h"
#import "BIDAppDelegate.h"
#import "BIDDisclosureDetailController.h"

@interface BIDDisclosureButtonController ()
//this property will not be accessed by outer class
@property (strong, nonatomic) BIDDisclosureDetailController *childController;

@end

@implementation BIDDisclosureButtonController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSArray *array = [[NSArray alloc]initWithObjects:@"Toy Story", @"A Bug's Life", @"Toy Story 2",
                      @"Monsters, Inc.", @"Finding Nemo", @"The Incredibles", @"Cars", @"Ratatouille",
                      @"WALL-E", @"Up", @"Toy Story 3", @"Cars 2", @"Brave",nil];
    self.list = array;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.list = nil;
    self.childController = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Table Data Source Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.list count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *DisclosureButtonCellIdentifier = @"DisclosureButtonCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DisclosureButtonCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DisclosureButtonCellIdentifier];
    }
    NSInteger row = [indexPath row];
    NSString *rowString = [self.list objectAtIndex:row];
    cell.textLabel.text = rowString;
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    return cell;
}

#pragma mark -
#pragma mark Table Delegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Hey, do you see the disclosure button?" message:@"If you're trying to drill down, touch that instead" delegate:nil cancelButtonTitle:@"Won't happen again" otherButtonTitles:nil];
    [alert show];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    if (self.childController == nil) {
        self.childController = [[BIDDisclosureDetailController alloc]initWithNibName:@"BIDDisclosureDetail" bundle:nil];
    }
    
    self.childController.title = @"Disclosure Button Pressed";
    NSUInteger row = [indexPath row];
    NSString *selectedMovie = [self.list objectAtIndex:row];
    NSString *detailMessage = [[NSString alloc]initWithFormat:@"You pressed the disclosure button for %@.", selectedMovie];
    self.childController.message = detailMessage;
    [self.navigationController pushViewController:self.childController animated:YES];
}

@end
