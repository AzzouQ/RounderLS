#import <Preferences/PSSpecifier.h>
#import <Preferences/PSListController.h>
#import <Cephei/HBPreferences.h>
#import <Cephei/HBRespringController.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>

#import "../Tweak/RounderLSPreferences.h"

@interface RounderLSAppearanceSettings : HBAppearanceSettings
@end

@interface RounderLSRootListController : HBRootListController

@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UIView *bannerView;
@property (nonatomic, retain) UIImageView *bannerImage;

- (void)reset;
- (void)respring;

@end