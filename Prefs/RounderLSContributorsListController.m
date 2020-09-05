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

- (NSArray *)specifiers {

	if (_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Contributors" target:self] retain];
	}

	return _specifiers;
}

- (void)setSpecifier:(PSSpecifier *)specifier {

	[super setSpecifier:specifier];

	[self setTitle:[specifier name]];
	[self.navigationItem setTitle:[specifier name]];
}

- (BOOL)shouldReloadSpecifiersOnResume {

	return NO;
}

@end