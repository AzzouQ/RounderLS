#import "RounderLSContributorsListController.h"

@implementation RounderLSContributorsListController

- (instancetype)init {

	if (!(self = [super init])) {
		return self;
	}
	
	RounderLSAppearanceSettings* appearanceSettings = [[RounderLSAppearanceSettings alloc] init];
	
	self.hb_appearanceSettings = appearanceSettings;

	return self;
}

- (void)setSpecifier:(PSSpecifier *)specifier {

	_specifiers = [[self loadSpecifiersFromPlistName:@"Contributors" target:self] retain];

	[self setTitle:[specifier name]];
	[self.navigationItem setTitle:[specifier name]];

	[super setSpecifier:specifier];
}

- (BOOL)shouldReloadSpecifiersOnResume {

	return NO;
}

@end