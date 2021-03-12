#import "RounderLSContributorListController.h"

@implementation RounderLSContributorListController

- (id)specifiers {

	if (!_specifiers) _specifiers = [self loadSpecifiersFromPlistName:@"ContributorList" target:self];

	return _specifiers;
}

@end