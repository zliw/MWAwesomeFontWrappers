//
//  FAKFontAwesome+ImageCreator.m
//  MWAwesomeFontWrapperExample
//
//  Created by martin on 23/05/14.
//  Copyright (c) 2014 Martin Wilz. All rights reserved.
//

#import "FAKFontAwesome+ImageCreator.h"

@implementation FAKFontAwesome (ImageCreator)


+ (NSString *)unicodeCharacterForGlyphWithName:(NSString *)name
{
    // remove leading fa
    name = [name substringFromIndex:2];

    NSRange range;
    range = [name rangeOfString:@"-"];

    if (range.location == 0) {
        name = [name substringFromIndex:1];
        range = [name rangeOfString:@"-"];
    }

    // map to camel case. TODO: use string category
    do {
        range = [name rangeOfString:@"-"];

        if (range.location != NSNotFound || range.location == name.length - 1) {

            NSRange nextCharRange = range;
            nextCharRange.location++;
            range.length++;
            NSString *nextChar = [[name substringWithRange:nextCharRange] capitalizedString];
            name = [name stringByReplacingCharactersInRange:range withString:nextChar];
        }
    }
    while (range.location != NSNotFound);

    NSArray *iconCodes = [[FAKFontAwesome allIcons] allKeysForObject:name];

    if (iconCodes && iconCodes.count > 0) {
        return [iconCodes objectAtIndex:0];
    }

    return nil;
}

+ (UIImage *)tabBarItemImageWithName:(NSString *)name
{
    NSString *iconGlyphCode = [self unicodeCharacterForGlyphWithName:name];

    if (iconGlyphCode) {

        CGFloat scale = 1.0;
        if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] == YES) {
            scale = [[UIScreen mainScreen] scale];
        }

        // image size should be about 25 pixels according human interface guidelines
        FAKFontAwesome *icon = [FAKFontAwesome iconWithCode:iconGlyphCode size:16 * scale];

        return [icon imageWithSize:CGSizeMake(25 * scale, 25 * scale)];
    }
    
    return nil;
}

+ (UIImage *)navigationBarButtomImageWithName:(NSString *)name
{
    NSString *iconGlyphCode = [self unicodeCharacterForGlyphWithName:name];

    if (iconGlyphCode) {

        CGFloat scale = 1.0;
        if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] == YES) {
            scale = [[UIScreen mainScreen] scale];
        }

        // image size should be about 22 pixels according human interface guidelines
        FAKFontAwesome *icon = [FAKFontAwesome iconWithCode:iconGlyphCode size:16 * scale];

        return [icon imageWithSize:CGSizeMake(22 * scale, 22 * scale)];
    }

    return nil;
}

@end
