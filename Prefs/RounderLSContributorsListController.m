#import "RounderLSContributorsListController.h"

@implementation RounderLSContributorsListController

- (instancetype)init {

	if (!(self = [super init])) {
		return self;
	}

	return self;
}

- (id)specifiers {

	if (_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Contributors" target:self] retain];
	}

	return _specifiers;
}

@end