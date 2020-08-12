#import "RounderLS.h"

BOOL isEnabled;

%group RounderLS

%hook CSCoverSheetViewController

- (void)viewWillAppear:(BOOL)animated {

	%orig;

	SBCoverSheetPanelBackgroundContainerView *backgroundView = self.view.superview.superview.superview.subviews[0];

	[[self view] setClipsToBounds:YES];
	[[[self view] layer] setCornerRadius:[borderRadius doubleValue]];
	[backgroundView setClipsToBounds:YES];
	[[backgroundView layer] setCornerRadius:[borderRadius doubleValue]];
}


- (void)viewDidAppear:(BOOL)animated {

	%orig;

	SBCoverSheetPanelBackgroundContainerView *backgroundView = self.view.superview.superview.superview.subviews[0];

	[[self view] setClipsToBounds:NO];
	[[[self view] layer] setCornerRadius:0];
	[backgroundView setClipsToBounds:NO];
	[[backgroundView layer] setCornerRadius:0];
}


- (void)viewWillDisappear:(BOOL)animated {

	%orig;

	SBCoverSheetPanelBackgroundContainerView *backgroundView = self.view.superview.superview.superview.subviews[0];

	[[self view] setClipsToBounds:YES];
	[[[self view] layer] setCornerRadius:[borderRadius doubleValue]];
	[backgroundView setClipsToBounds:YES];
	[[backgroundView layer] setCornerRadius:[borderRadius doubleValue]];
}

- (void)viewDidDisappear:(BOOL)animated {

	%orig;

	SBCoverSheetPanelBackgroundContainerView *backgroundView = self.view.superview.superview.superview.subviews[0];

	[[self view] setClipsToBounds:NO];
	[[[self view] layer] setCornerRadius:0];
	[backgroundView setClipsToBounds:NO];
	[[backgroundView layer] setCornerRadius:0];
}

%end

%end

%ctor {

	prefs = [[HBPreferences alloc] initWithIdentifier:@"com.azzou.rounderlsprefs"];

	[prefs registerBool:&isEnabled default:YES forKey:@"Enabled"];
	[prefs registerObject:&borderRadius default:@"39.0" forKey:@"borderRadius"];

	if (isEnabled) {
		%init(RounderLS);
	}
}
