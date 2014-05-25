//
//  MWAwesomeFontButton.m
//  MWAwesomeFontWrapperExample
//
//  Created by martin on 25/05/14.
//  Copyright (c) 2014 Martin Wilz. All rights reserved.
//

#import "MWAwesomeFontButton.h"
#import "FAKFontAwesome+ImageCreator.h"

@implementation MWAwesomeFontButton

- (void)awakeFromNib
{
    [super awakeFromNib];

    NSString *iconName = [[self.titleLabel.text copy] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];

    // simple case icon only
    if ([iconName hasPrefix:@"fa"]) {

        UIImage *image = [FAKFontAwesome tabBarItemImageWithName:iconName];

        if (image) {
            [self setImage:image forState:UIControlStateNormal];
            [self setTitle:@"" forState:UIControlStateNormal];
            [self setTitle:@"" forState:UIControlStateHighlighted];
            [self setTitle:@"" forState:UIControlStateDisabled];
        }
    }

}

@end
