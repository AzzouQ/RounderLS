#import "RounderLS.h"

%group RounderLS

%hook CSCoverSheetViewController

- (void)viewWillAppear:(BOOL)animated {

	%orig;

	SBCoverSheetPanelBackgroundContainerView *backgroundView = self.view.superview.superview.superview.subviews[0];

	self.view.clipsToBounds = YES;
	self.view.layer.cornerRadius = borderRadius;

	backgroundView.clipsToBounds = YES;
	backgroundView.layer.cornerRadius = borderRadius;
}


- (void)viewDidAppear:(BOOL)animated {

	%orig;

	SBCoverSheetPanelBackgroundContainerView *backgroundView = self.view.superview.superview.superview.subviews[0];

	self.view.clipsToBounds = NO;
	self.view.layer.cornerRadius = 0;

	backgroundView.clipsToBounds = NO;
	backgroundView.layer.cornerRadius = 0;
}


- (void)viewWillDisappear:(BOOL)animated {

	%orig;

	SBCoverSheetPanelBackgroundContainerView *backgroundView = self.view.superview.superview.superview.subviews[0];

	self.view.clipsToBounds = YES;
	self.view.layer.cornerRadius = borderRadius;

	backgroundView.clipsToBounds = YES;
	backgroundView.layer.cornerRadius = borderRadius;
}

- (void)viewDidDisappear:(BOOL)animated {

	%orig;

	SBCoverSheetPanelBackgroundContainerView *backgroundView = self.view.superview.superview.superview.subviews[0];

	self.view.clipsToBounds = NO;
	self.view.layer.cornerRadius = 0;

	backgroundView.clipsToBounds = NO;
	backgroundView.layer.cornerRadius = 0;
}

%end

%end

%ctor {

	prefs = [[HBPreferences alloc] initWithIdentifier:@"com.azzou.rounderlsprefs"];

	[prefs registerBool:&isEnabled default:YES forKey:@"Enabled"];
	[prefs registerFloat:&borderRadius default:39.0 forKey:@"borderRadius"];

	if (isEnabled) {
		%init(RounderLS);
	}
}