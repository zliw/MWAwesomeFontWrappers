//
//  MWAwesomeFontTabItem.m
//  MWAwesomeFontWrapperExample
//
//  Created by martin on 23/05/14.
//  Copyright (c) 2014 Martin Wilz. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MWAwesomeFontTabBarItem.h"
#import "FAKFontAwesome+ImageCreator.h"

@implementation MWAwesomeFontTabBarItem

- (void)awakeFromNib
{
    [super awakeFromNib];

    NSString *iconName = [[self.title copy] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];

    // simple case icon only
    if ([iconName hasPrefix:@"fa"]) {

        UIImage *image = [FAKFontAwesome tabBarItemImageWithName:iconName];

        if (image) {
            self.image = image;
            self.title = nil;
        }
    }

    // text with icon

    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\[(.*?)\\]"
                                                                           options:0
                                                                             error:&error];
     NSArray *matches = [regex matchesInString:iconName
                                       options:0
                                         range:NSMakeRange(0, iconName.length)];

    if (matches.count == 1) {
        NSTextCheckingResult *match = matches[0];
        iconName = [iconName substringWithRange:match.range];
        NSLog(@"matched %@", iconName);

        NSString *withoutBrackets = [self.title stringByReplacingOccurrencesOfString:iconName withString:@""];

        iconName = [iconName stringByReplacingOccurrencesOfString:@"[" withString:@""];
        iconName = [iconName stringByReplacingOccurrencesOfString:@"]" withString:@""];

        UIImage *image = [FAKFontAwesome tabBarItemImageWithName:iconName];

        if (image) {
            self.image = image;
            self.title = withoutBrackets;
        }
    }
}

@end
