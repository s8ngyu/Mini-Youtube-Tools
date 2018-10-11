#include "MYTRootListController.h"

@implementation MYTRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

- (instancetype)init {
    self = [super init];

    if (self) {
        HBAppearanceSettings *appearanceSettings = [[HBAppearanceSettings alloc] init];
        appearanceSettings.tableViewCellSeparatorColor = [UIColor colorWithWhite:0 alpha:0];
        appearanceSettings.tintColor = [UIColor colorWithRed:0.9294 green:0.1294 blue:0.2275 alpha:1];
        self.hb_appearanceSettings = appearanceSettings;
    }

    return self;
}

@end
