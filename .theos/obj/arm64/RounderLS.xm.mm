#line 1 "RounderLS.xm"
#import "RounderLS.h"

BOOL isEnabled;


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class CSCoverSheetViewController; 


#line 5 "RounderLS.xm"
static void (*_logos_orig$RounderLS$CSCoverSheetViewController$viewWillAppear$)(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$RounderLS$CSCoverSheetViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$RounderLS$CSCoverSheetViewController$viewDidAppear$)(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$RounderLS$CSCoverSheetViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$RounderLS$CSCoverSheetViewController$viewWillDisappear$)(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$RounderLS$CSCoverSheetViewController$viewWillDisappear$(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$RounderLS$CSCoverSheetViewController$viewDidDisappear$)(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$RounderLS$CSCoverSheetViewController$viewDidDisappear$(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST, SEL, BOOL); 



static void _logos_method$RounderLS$CSCoverSheetViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL animated) {

	_logos_orig$RounderLS$CSCoverSheetViewController$viewWillAppear$(self, _cmd, animated);

	SBCoverSheetPanelBackgroundContainerView *backgroundView = self.view.superview.superview.superview.subviews[0];

	[[self view] setClipsToBounds:TRUE];
	[[[self view] layer] setCornerRadius:[borderRadius doubleValue]];
	[backgroundView setClipsToBounds:TRUE];
	[[backgroundView layer] setCornerRadius:[borderRadius doubleValue]];
}


static void _logos_method$RounderLS$CSCoverSheetViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL animated) {

	_logos_orig$RounderLS$CSCoverSheetViewController$viewDidAppear$(self, _cmd, animated);

	SBCoverSheetPanelBackgroundContainerView *backgroundView = self.view.superview.superview.superview.subviews[0];

	[[self view] setClipsToBounds:FALSE];
	[[[self view] layer] setCornerRadius:0];
	[backgroundView setClipsToBounds:FALSE];
	[[backgroundView layer] setCornerRadius:0];
}


static void _logos_method$RounderLS$CSCoverSheetViewController$viewWillDisappear$(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL animated) {

	_logos_orig$RounderLS$CSCoverSheetViewController$viewWillDisappear$(self, _cmd, animated);

	SBCoverSheetPanelBackgroundContainerView *backgroundView = self.view.superview.superview.superview.subviews[0];

	[[self view] setClipsToBounds:TRUE];
	[[[self view] layer] setCornerRadius:[borderRadius doubleValue]];
	[backgroundView setClipsToBounds:TRUE];
	[[backgroundView layer] setCornerRadius:[borderRadius doubleValue]];
}

static void _logos_method$RounderLS$CSCoverSheetViewController$viewDidDisappear$(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL animated) {

	_logos_orig$RounderLS$CSCoverSheetViewController$viewDidDisappear$(self, _cmd, animated);

	SBCoverSheetPanelBackgroundContainerView *backgroundView = self.view.superview.superview.superview.subviews[0];

	[[self view] setClipsToBounds:FALSE];
	[[[self view] layer] setCornerRadius:0];
	[backgroundView setClipsToBounds:FALSE];
	[[backgroundView layer] setCornerRadius:0];
}





static __attribute__((constructor)) void _logosLocalCtor_99ca4bba(int __unused argc, char __unused **argv, char __unused **envp) {

	prefs = [[HBPreferences alloc] initWithIdentifier:@"com.azzou.rounderlsprefs"];

	[prefs registerBool:&isEnabled default:YES forKey:@"Enabled"];
	[prefs registerObject:&borderRadius default:@"39.0" forKey:@"borderRadius"];

	if (isEnabled) {
		{Class _logos_class$RounderLS$CSCoverSheetViewController = objc_getClass("CSCoverSheetViewController"); { MSHookMessageEx(_logos_class$RounderLS$CSCoverSheetViewController, @selector(viewWillAppear:), (IMP)&_logos_method$RounderLS$CSCoverSheetViewController$viewWillAppear$, (IMP*)&_logos_orig$RounderLS$CSCoverSheetViewController$viewWillAppear$);}{ MSHookMessageEx(_logos_class$RounderLS$CSCoverSheetViewController, @selector(viewDidAppear:), (IMP)&_logos_method$RounderLS$CSCoverSheetViewController$viewDidAppear$, (IMP*)&_logos_orig$RounderLS$CSCoverSheetViewController$viewDidAppear$);}{ MSHookMessageEx(_logos_class$RounderLS$CSCoverSheetViewController, @selector(viewWillDisappear:), (IMP)&_logos_method$RounderLS$CSCoverSheetViewController$viewWillDisappear$, (IMP*)&_logos_orig$RounderLS$CSCoverSheetViewController$viewWillDisappear$);}{ MSHookMessageEx(_logos_class$RounderLS$CSCoverSheetViewController, @selector(viewDidDisappear:), (IMP)&_logos_method$RounderLS$CSCoverSheetViewController$viewDidDisappear$, (IMP*)&_logos_orig$RounderLS$CSCoverSheetViewController$viewDidDisappear$);}}
	}
}
