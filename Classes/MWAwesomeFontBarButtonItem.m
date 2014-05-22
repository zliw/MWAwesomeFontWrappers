//
//  MWAwesomeFontBarButtonItem.m
//  MWAwesomeFontWrapperExample
//
//  Created by martin on 22/05/14.
//  Copyright (c) 2014 Martin Wilz. All rights reserved.
//

#import "MWAwesomeFontBarButtonItem.h"
#import "FontAwesomeKit/FAKFontAwesome.h"


/** drop in replacement for UIBarButtonItem. It checks on startup, if the title of the button starts with the string
 fa. It then tries to lookup the corresponding icon and sets this as an image (and removes the title). the tint
 set in interface builder is still used.
 */
@implementation MWAwesomeFontBarButtonItem

- (void)awakeFromNib
{
    [super awakeFromNib];

    NSString *iconName = [[self.title copy] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];

    if ([self.title hasPrefix:@"fa"]) {

        // remove leading fa
        iconName = [iconName substringFromIndex:2];

        NSRange range;
        range = [iconName rangeOfString:@"-"];

        if (range.location == 0) {
            iconName = [iconName substringFromIndex:1];
            range = [iconName rangeOfString:@"-"];
        }

        // map to camel case. TODO: use string category
        do {
            range = [iconName rangeOfString:@"-"];

            if (range.location != NSNotFound || range.location == iconName.length - 1) {

                NSRange nextCharRange = range;
                nextCharRange.location++;
                range.length++;
                NSString *nextChar = [[iconName substringWithRange:nextCharRange] capitalizedString];
                iconName = [iconName stringByReplacingCharactersInRange:range withString:nextChar];
            }
        }
        while (range.location != NSNotFound);


        NSArray *iconCodes = [[FAKFontAwesome allIcons] allKeysForObject:iconName];

        if (iconCodes && iconCodes.count > 0) {
            NSString *iconCode = [iconCodes objectAtIndex:0];

            CGFloat scale = 1.0;
            if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] == YES) {
                scale = [[UIScreen mainScreen] scale];
            }

            // image size should be about 22 pixels according human interface guidelines
            FAKFontAwesome *icon = [FAKFontAwesome iconWithCode:iconCode size:16 * scale];

            UIImage *iconImage = [icon imageWithSize:CGSizeMake(22 * scale, 22 * scale)];

            self.image = iconImage;
            self.title = nil;
        }
    }

}


@end
