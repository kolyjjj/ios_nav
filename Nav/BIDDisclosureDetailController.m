//
//  BIDDisclosureDetailController.m
//  Nav
//
//  Created by koly on 12/23/12.
//  Copyright (c) 2012 koly. All rights reserved.
//

#import "BIDDisclosureDetailController.h"

@interface BIDDisclosureDetailController ()

@end

@implementation BIDDisclosureDetailController

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
}

- (void)viewWillAppear:(BOOL)animated
{
    self.label.text = self.message;
    [super viewWillAppear:animated];
}

- (void)viewDidUnload
{
    self.label = nil;
    self.message = nil;
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
