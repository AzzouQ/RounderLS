#import "RounderLSRootListController.h"

@implementation RounderLSRootListController

- (void)viewDidLoad {

	[super viewDidLoad];

	prefs = [[HBPreferences alloc] initWithIdentifier: @"com.azzou.rouderLS"];

	self.hb_appearanceSettings = [[RounderLSAppearanceSettings alloc] init];

	self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,10,10)];
	self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
	self.titleLabel.font = [UIFont boldSystemFontOfSize:17];
	self.titleLabel.text = @"1.4";
	self.titleLabel.textColor = [UIColor colorWithRed:0.96 green:0.77 blue:0.75 alpha:1.0];
	self.titleLabel.textAlignment = NSTextAlignmentCenter;

	self.bannerImage = [[UIImageView alloc] init];
	self.bannerImage.translatesAutoresizingMaskIntoConstraints = NO;
	self.bannerImage.clipsToBounds = YES;
	self.bannerImage.contentMode = UIViewContentModeScaleAspectFill;
	self.bannerImage.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/RounderLSPrefs.bundle/banner.png"];

	self.bannerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,200,200)];
	[self.bannerView addSubview:self.bannerImage];

	self.navigationItem.titleView = [UIView new];
	[self.navigationItem.titleView addSubview:self.titleLabel];
	[self.navigationItem.titleView addSubview:self.bannerView];

	self.table.tableHeaderView = [self bannerView];

	[NSLayoutConstraint activateConstraints:@[
		[self.titleLabel.topAnchor constraintEqualToAnchor:self.navigationItem.titleView.topAnchor],
		[self.titleLabel.leadingAnchor constraintEqualToAnchor:self.navigationItem.titleView.leadingAnchor],
		[self.titleLabel.trailingAnchor constraintEqualToAnchor:self.navigationItem.titleView.trailingAnchor],
		[self.titleLabel.bottomAnchor constraintEqualToAnchor:self.navigationItem.titleView.bottomAnchor],
		[self.bannerImage.topAnchor constraintEqualToAnchor:self.bannerView.topAnchor],
		[self.bannerImage.leadingAnchor constraintEqualToAnchor:self.bannerView.leadingAnchor],
		[self.bannerImage.trailingAnchor constraintEqualToAnchor:self.bannerView.trailingAnchor],
		[self.bannerImage.bottomAnchor constraintEqualToAnchor:self.bannerView.bottomAnchor],
	]];
}

- (id)specifiers {

	if (!_specifiers) _specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];

	return _specifiers;
}

- (void)reset {

	UIAlertController *resetAlert = [UIAlertController alertControllerWithTitle:@"RounderLS" message:@"You are about to erase all your preferences. Continue ?" preferredStyle:UIAlertControllerStyleActionSheet];
	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
	UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"Continue" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
		[prefs removeAllObjects];
		[self respring];
	}];

	[resetAlert addAction:cancelAction];
	[resetAlert addAction:confirmAction];

	[self presentViewController:resetAlert animated:YES completion:nil];
}

- (void)respring {

	if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/shuffle.dylib"]) {
		HBPreferences *shufflePrefs = [[HBPreferences alloc] initWithIdentifier: @"com.creaturecoding.shuffle"];
		[HBRespringController respringAndReturnTo:[NSURL URLWithString:[NSString stringWithFormat:@"Prefs:root=%@&path=RounderLS", [shufflePrefs objectForKey:@"kTweaksGroupName" default:@"Tweaks"]]]];
	} else {
		[HBRespringController respringAndReturnTo:[NSURL URLWithString:[NSString stringWithFormat:@"Prefs:root=RounderLS"]]];
	}
}

@end