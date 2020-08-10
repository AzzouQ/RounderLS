#include "../Tweak/RounderLS.h"
#include "RLSRootListController.h"

BOOL isEnabled = YES;

@implementation RLSRootListController

- (instancetype)init {
    self = [super init];

    if (self) {
        RLSAppearanceSettings *appearanceSettings = [[RLSAppearanceSettings alloc] init];
        self.hb_appearanceSettings = appearanceSettings;

        self.enableSwitch = [[UISwitch alloc] init];
        [self.enableSwitch addTarget:self action:@selector(toggleState) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *switchy = [[UIBarButtonItem alloc] initWithCustomView: self.enableSwitch];

        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,10,10)];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.titleLabel.text = @"1.0";
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;

        self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,10,10)];
        self.iconView.contentMode = UIViewContentModeScaleAspectFit;
        self.iconView.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/RLSPrefs.bundle/icon@2x.png"];
        self.iconView.translatesAutoresizingMaskIntoConstraints = NO;
        self.iconView.alpha = 0.0;

        self.navigationItem.rightBarButtonItem = switchy;
        self.navigationItem.titleView = [UIView new];
        [self.navigationItem.titleView addSubview:self.titleLabel];
        [self.navigationItem.titleView addSubview:self.iconView];

        [NSLayoutConstraint activateConstraints:@[
            [self.titleLabel.topAnchor constraintEqualToAnchor:self.navigationItem.titleView.topAnchor],
            [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.navigationItem.titleView.leadingAnchor],
            [self.titleLabel.trailingAnchor constraintEqualToAnchor:self.navigationItem.titleView.trailingAnchor],
            [self.titleLabel.bottomAnchor constraintEqualToAnchor:self.navigationItem.titleView.bottomAnchor],
            [self.iconView.topAnchor constraintEqualToAnchor:self.navigationItem.titleView.topAnchor],
            [self.iconView.leadingAnchor constraintEqualToAnchor:self.navigationItem.titleView.leadingAnchor],
            [self.iconView.trailingAnchor constraintEqualToAnchor:self.navigationItem.titleView.trailingAnchor],
            [self.iconView.bottomAnchor constraintEqualToAnchor:self.navigationItem.titleView.bottomAnchor],
        ]];
    }

    return self;
}

-(NSArray *)specifiers {
	if (_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

- (void)viewDidLoad {

    [super viewDidLoad];

    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,200,200)];
    self.headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,200,200)];
    self.headerImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.headerImageView.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/RLSPrefs.bundle/Banner.png"];
    self.headerImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.headerImageView.clipsToBounds = YES;

    [self.headerView addSubview:self.headerImageView];
    [NSLayoutConstraint activateConstraints:@[
        [self.headerImageView.topAnchor constraintEqualToAnchor:self.headerView.topAnchor],
        [self.headerImageView.leadingAnchor constraintEqualToAnchor:self.headerView.leadingAnchor],
        [self.headerImageView.trailingAnchor constraintEqualToAnchor:self.headerView.trailingAnchor],
        [self.headerImageView.bottomAnchor constraintEqualToAnchor:self.headerView.bottomAnchor],
    ]];

    _table.tableHeaderView = self.headerView;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    tableView.tableHeaderView = self.headerView;
    return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];

    CGRect frame = self.table.bounds;
    frame.origin.y = -frame.size.height;

    self.navigationController.navigationController.navigationBar.barTintColor = [UIColor colorWithRed: 0.76 green: 0.67 blue: 1.00 alpha: 1.00];
    [self.navigationController.navigationController.navigationBar setShadowImage: [UIImage new]];
    self.navigationController.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationController.navigationBar.translucent = YES;

    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:blur];
    [blurView setFrame:self.view.bounds];
    [blurView setAlpha:1.0];
    [[self view] addSubview:blurView];

    [UIView animateWithDuration:.4 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [blurView setAlpha:0.0];
    } completion:nil];

}

- (void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];

    [self.navigationController.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];

    [self setEnableSwitchState];
}

- (void)viewWillDisappear:(BOOL)animated {

    [super viewWillDisappear:animated];

    [self.navigationController.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    CGFloat offsetY = scrollView.contentOffset.y;

    if (offsetY > 200) {
        [UIView animateWithDuration:0.2 animations:^{
            self.iconView.alpha = 1.0;
            self.titleLabel.alpha = 0.0;
        }];
    } else {
        [UIView animateWithDuration:0.2 animations:^{
            self.iconView.alpha = 0.0;
            self.titleLabel.alpha = 1.0;
        }];
    }
}

- (void)toggleState {

    [[self enableSwitch] setEnabled:YES];

    NSString* path = [NSString stringWithFormat:@"/var/mobile/Library/Preferences/com.azzou.rounderlsprefs.plist"];
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    NSSet* allKeys = [NSSet setWithArray:[dictionary allKeys]];
    HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier: @"com.azzou.rounderlsprefs"];

    if (!([allKeys containsObject:@"Enabled"])) {
        isEnabled = NO;
        [prefs setBool:isEnabled forKey:@"Enabled"];
        [self respring];
    } else if ([[prefs objectForKey:@"Enabled"] isEqual:@(YES)]) {
        isEnabled = NO;
        [prefs setBool:isEnabled forKey:@"Enabled"];
        [self respring];
    } else if ([[prefs objectForKey:@"Enabled"] isEqual:@(NO)]) {
        isEnabled = YES;
        [prefs setBool:isEnabled forKey:@"Enabled"];
        [self respring];
    }
}

- (void)setEnableSwitchState {

    NSString* path = [NSString stringWithFormat:@"/var/mobile/Library/Preferences/com.azzou.rounderlsprefs.plist"];
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    NSSet* allKeys = [NSSet setWithArray:[dictionary allKeys]];
    HBPreferences* prefs = [[HBPreferences alloc] initWithIdentifier: @"com.azzou.rounderlsprefs"];

    if (!([allKeys containsObject:@"Enabled"]))
        [[self enableSwitch] setOn:YES animated:YES];
    else if ([[prefs objectForKey:@"Enabled"] isEqual:@(YES)])
        [[self enableSwitch] setOn:YES animated:YES];
    else if ([[prefs objectForKey:@"Enabled"] isEqual:@(NO)])
        [[self enableSwitch] setOn:NO animated:YES];
}

- (void)resetPrompt {

    UIAlertController* resetAlert = [UIAlertController alertControllerWithTitle:@"RounderLS"
	message:@"Do you really want to reset your preferences ?"
	preferredStyle:UIAlertControllerStyleActionSheet];
	
    UIAlertAction* confirmAction = [UIAlertAction actionWithTitle:@"Yep" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
        [self resetPreferences];
	}];

	UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Nope" style:UIAlertActionStyleCancel handler:nil];

	[resetAlert addAction:confirmAction];
	[resetAlert addAction:cancelAction];

	[self presentViewController:resetAlert animated:YES completion:nil];
}

- (void)resetPreferences {

    HBPreferences* preferences = [[HBPreferences alloc] initWithIdentifier: @"com.azzou.rounderlsprefs"];
    for (NSString* key in [preferences dictionaryRepresentation]) {
        [preferences removeObjectForKey:key];

    }

    [self respring];
}

- (void)respring {

    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:blur];
    [blurView setFrame:self.view.bounds];
    [blurView setAlpha:0.0];
    [[self view] addSubview:blurView];

    [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [blurView setAlpha:1.0];
    } completion:^(BOOL finished) {
        [self respringUtil];
    }];
}

- (void)respringUtil {

    pid_t pid;
    const char* args[] = {"killall", "backboardd", NULL};

    [HBRespringController respringAndReturnTo:[NSURL URLWithString:@"prefs:root=RounderLS"]];

    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char *const *)args, NULL);
}

@end