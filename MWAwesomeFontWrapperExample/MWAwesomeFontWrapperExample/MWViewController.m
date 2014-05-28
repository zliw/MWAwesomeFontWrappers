//
//  MWViewController.m
//  MWAwesomeFontWrapperExample
//
//  Created by martin on 21/05/14.
//  Copyright (c) 2014 Martin Wilz. All rights reserved.
//

#import "MWAwesomeFontNavigationBarItem.h"
#import "MWViewController.h"

@interface MWViewController ()

@end

@implementation MWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    MWAwesomeFontNavigationBarItem *item = [MWAwesomeFontNavigationBarItem barItemWithFontAwesomeIconName:@"fa-circle"];
    self.navigationItem.rightBarButtonItem = item;
}

@end
