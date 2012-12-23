//
//  BIDDisclosureDetailController.h
//  Nav
//
//  Created by koly on 12/23/12.
//  Copyright (c) 2012 koly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDDisclosureDetailController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *label;
//why use copy?
@property (copy, nonatomic) NSString *message;

@end
