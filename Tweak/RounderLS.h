#import <UIKit/UIKit.h>
#import <Cephei/HBPreferences.h>

@interface SBCoverSheetPanelBackgroundContainerView : UIView
@end
@interface CSCoverSheetView : UIView
@end
@interface CSCoverSheetViewController : UIViewController
@end

HBPreferences *prefs;
extern BOOL isEnabled;

NSString *borderRadius = @"39.0";