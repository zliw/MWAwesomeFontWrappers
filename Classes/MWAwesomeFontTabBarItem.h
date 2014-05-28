//
//  MWAwesomeFontTabItem.h
//  MWAwesomeFontWrapperExample
//
//  Created by martin on 23/05/14.
//  Copyright (c) 2014 Martin Wilz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MWAwesomeFontTabBarItem : UITabBarItem

/** convenience class method for creating barItems from code
 * @param iconName a NSString containing the font awesome name of the icon (e.g. @"fa-bars")
 * @return a MWAwesomeFontTabBarItem. The image is not set, if the icon with the name is unknown
 */
+ (instancetype)barItemWithFontAwesomeIconName:(NSString *)iconName;

@end
