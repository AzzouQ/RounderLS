#import "RounderLS.h"

BOOL isEnabled;

%group RounderLS

%hook CSCoverSheetViewController

- (void)viewWillAppear:(BOOL)animated {

	%orig;

	if (isEnabled) {
		SBCoverSheetPanelBackgroundContainerView *backgroundView = self.view.superview.superview.superview.subviews[0];

		[backgroundView setClipsToBounds:TRUE];
		[[backgroundView layer] setCornerRadius:39];
	}
}


- (void)viewDidAppear:(BOOL)animated {

	%orig;

	if (isEnabled) {
		SBCoverSheetPanelBackgroundContainerView *backgroundView = self.view.superview.superview.superview.subviews[0];

		[backgroundView setClipsToBounds:FALSE];
		[[backgroundView layer] setCornerRadius:0];
	}
}


- (void)viewWillDisappear:(BOOL)animated {

	%orig;

	if (isEnabled) {
		SBCoverSheetPanelBackgroundContainerView *backgroundView = self.view.superview.superview.superview.subviews[0];

		[backgroundView setClipsToBounds:TRUE];
		[[backgroundView layer] setCornerRadius:39];
	}
}

- (void)viewDidDisappear:(BOOL)animated {

	%orig;

	if (isEnabled) {
		SBCoverSheetPanelBackgroundContainerView *backgroundView = self.view.superview.superview.superview.subviews[0];

		[backgroundView setClipsToBounds:FALSE];
		[[backgroundView layer] setCornerRadius:0];
	}
}

%end

%end

%ctor {

	prefs = [[HBPreferences alloc] initWithIdentifier:@"com.azzou.rounderlsprefs"];

	[prefs registerBool:&isEnabled default:YES forKey:@"Enabled"];

	if (isEnabled) {
		%init(RounderLS);
	}
}
