//
//  MWAwesomeFontBarButtonItem.h
//  MWAwesomeFontWrapperExample
//
//  Created by martin on 22/05/14.
//  Copyright (c) 2014 Martin Wilz. All rights reserved.
//

#import <UIKit/UIKit.h>

/** drop in replacement for UIBarButtonItem. It checks on startup, if the title of the button starts with the string
 fa. It then tries to lookup the corresponding icon and sets this as an image (and removes the title). the tint
 set in interface builder is still used.
 */
@interface MWAwesomeFontNavigationBarItem : UIBarButtonItem

/** convenience class method for creating barItems from code
  * @param iconName a NSString containing the font awesome name of the icon (e.g. @"fa-bars")
  * @return a MWAwesomeFontNavigationBarItem. The image is not set, if the icon with the name is unknown
*/
+ (instancetype)barItemWithFontAwesomeIconName:(NSString *)iconName;

@end
