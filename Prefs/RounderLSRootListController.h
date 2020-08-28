#import <Preferences/PSSpecifier.h>
#import <Preferences/PSListController.h>
#import <Cephei/HBPreferences.h>
#import <Cephei/HBRespringController.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>

#include "../Tweak/RounderLSPreferences.h"

@interface RounderLSAppearanceSettings : HBAppearanceSettings
@end

@interface RounderLSRootListController : HBRootListController {
	UITableView *_table;
}

@property (nonatomic, retain) UISwitch *enableSwitch;
@property (nonatomic, retain) UIView *headerView;
@property (nonatomic, retain) UIImageView *headerImageView;
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UIImageView *iconView;

- (void)toggleState;
- (void)setEnableSwitchState;
- (void)reset;
- (void)respring;

@end