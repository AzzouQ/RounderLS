#import "RounderLS.h"

%group RounderLS

%hook SBCoverSheetPrimarySlidingViewController

- (void)viewDidLoad {

	%orig;

	/*
	//	SBCoverSheetPanelBackgroundContainerView
	//	Set the radius to every subviews of the CoverSheet
	*/
	self.view.subviews[0].clipsToBounds = YES;
	self.view.subviews[0].layer.maskedCorners = kCALayerMinXMaxYCorner | kCALayerMaxXMaxYCorner;
	self.view.subviews[0].layer.cornerCurve = kCACornerCurveContinuous;
	self.view.subviews[0].layer.cornerRadius = cornerRadius;

	/*
	//	CSCoverSheetView
	//	Needed to avoid notifications to overlap the radius
	*/
	self.childViewControllers[0].view.clipsToBounds = YES;
	self.childViewControllers[0].view.layer.maskedCorners = kCALayerMinXMaxYCorner | kCALayerMaxXMaxYCorner;
	self.childViewControllers[0].view.layer.cornerCurve = kCACornerCurveContinuous;
	self.childViewControllers[0].view.layer.cornerRadius = cornerRadius;
}

- (void)viewDidAppear:(BOOL)animated {

	self.view.subviews[0].layer.cornerRadius = 0;
	self.childViewControllers[0].view.layer.cornerRadius = 0;

	%orig;
}

- (void)viewWillDisappear:(BOOL)animated {

	self.view.subviews[0].layer.cornerRadius = cornerRadius;
	self.childViewControllers[0].view.layer.cornerRadius = cornerRadius;

	%orig;
}

%end

%end

%ctor {

	prefs = [[HBPreferences alloc] initWithIdentifier:@"com.azzou.rounderls"];

	[prefs registerFloat:&cornerRadius default:39.0 forKey:@"cornerRadius"];

	%init(RounderLS);
}