#import "RounderLSContributorsListController.h"

@implementation RounderLSContributorsListController

- (instancetype)init {

	self = [super init];

	if (self) {
		RounderLSAppearanceSettings* appearanceSettings = [[RounderLSAppearanceSettings alloc] init];
		self.hb_appearanceSettings = appearanceSettings;
	}

	return self;
}

- (id)specifiers {

	return _specifiers;
}

- (void)loadFromSpecifier:(PSSpecifier *)specifier {

	NSString *sub = [specifier propertyForKey:@"RounderLSSub"];
	NSString *title = [specifier name];

	_specifiers = [[self loadSpecifiersFromPlistName:sub target:self] retain];

	[self setTitle:title];
	[self.navigationItem setTitle:title];
}

- (void)setSpecifier:(PSSpecifier *)specifier {

	[self loadFromSpecifier:specifier];
	[super setSpecifier:specifier];
}

- (BOOL)shouldReloadSpecifiersOnResume {

	return false;
}

@end