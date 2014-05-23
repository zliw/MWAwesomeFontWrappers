//
//  MWAwesomeFontBarButtonItem.m
//  MWAwesomeFontWrapperExample
//
//  Created by martin on 22/05/14.
//  Copyright (c) 2014 Martin Wilz. All rights reserved.
//

#import "MWAwesomeFontNavigationBarItem.h"
#import "FontAwesomeKit/FAKFontAwesome.h"
#import "FAKFontAwesome+ImageCreator.h"


/** drop in replacement for UIBarButtonItem. It checks on startup, if the title of the button starts with the string
 fa. It then tries to lookup the corresponding icon and sets this as an image (and removes the title). the tint
 set in interface builder is still used.
 */
@implementation MWAwesomeFontNavigationBarItem

- (void)awakeFromNib
{
    [super awakeFromNib];

    NSString *iconName = [[self.title copy] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];

    if ([iconName hasPrefix:@"fa"]) {

        UIImage *image = [FAKFontAwesome navigationBarButtomImageWithName:iconName];

        if (image) {
            self.image = image;
            self.title = nil;
        }
    }
}


@end
