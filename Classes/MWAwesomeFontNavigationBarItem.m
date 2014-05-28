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


@implementation MWAwesomeFontNavigationBarItem

+ (instancetype)barItemWithFontAwesomeIconName:(NSString *)iconName
{
    MWAwesomeFontNavigationBarItem *item = [self new];
    if (item) {
        item.image = [FAKFontAwesome navigationBarButtomImageWithName:iconName];
    }
    return item;
}

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
