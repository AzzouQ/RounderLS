#import "RLSRootListController.h"

@implementation RLSAppearanceSettings

- (UIColor *)tintColor {
    return [UIColor colorWithRed:0.64 green:0.67 blue:1.00 alpha:1.0];;
}

- (UIColor *)statusBarTintColor {
    return [UIColor whiteColor];
}

- (UIColor *)navigationBarTintColor {
    return [UIColor whiteColor];
}

- (UIColor *)navigationBarTitleColor {
    return [UIColor whiteColor];
}

- (UIColor *)navigationBarBackgroundColor {
    return [UIColor colorWithRed:0.64 green:0.67 blue:1.00 alpha:1.0];;
}

- (UIColor *)tableViewCellSeparatorColor {
    return [UIColor colorWithWhite:0 alpha:0];
}

- (BOOL)translucentNavigationBar {
    return YES;
}

@end