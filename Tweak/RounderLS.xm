#import "RounderLS.h"

%group RounderLS

%hook SBCoverSheetPrimarySlidingViewController

- (void)viewDidLoad {

	/*
	//	SBCoverSheetPanelBackgroundContainerView
	//	Set the radius to every subviews of the CoverSheet
	*/
	self.view.subviews[0].clipsToBounds = YES;
	self.view.subviews[0].layer.maskedCorners = kCALayerMinXMaxYCorner | kCALayerMaxXMaxYCorner;
	self.view.subviews[0].layer.cornerRadius = cornerRadius;
	self.view.subviews[0].layer.cornerCurve = kCACornerCurveContinuous;

	/*
	//	CSCoverSheetView
	//	Needed to avoid notifications to overlap the radius
	*/
	self.childViewControllers[0].view.clipsToBounds = YES;
	self.childViewControllers[0].view.layer.maskedCorners = kCALayerMinXMaxYCorner | kCALayerMaxXMaxYCorner;
	self.childViewControllers[0].view.layer.cornerRadius = cornerRadius;
	self.view.subviews[0].layer.cornerCurve = kCACornerCurveContinuous;

	%orig;
}

%end

%end

%ctor {

	prefs = [[HBPreferences alloc] initWithIdentifier:@"com.azzou.rounderls"];

	[prefs registerFloat:&cornerRadius default:39.0 forKey:@"cornerRadius"];

	%init(RounderLS);
}