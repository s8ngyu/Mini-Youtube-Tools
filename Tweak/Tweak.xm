bool kEnable;
bool kNoAds;
bool kPlayBackground;
bool kShowPlayerBar;
bool kHideRelatedVideos;
bool kHideCreatorEndScreen;

%hook YTIPlayerResponse
-(bool)isMonetized {                   //Remove Ads
  if(kEnable && kNoAds) {
    return 0;
  }
return %orig;
}
%end

%hook YTSingleVideoMediaData
-(bool)isPlayableInBackground {        //Play Audio In Background
  if(kEnable && kPlayBackground) {
    return 1;
  }
  return %orig;
}

-(bool)isCurrentlyBackgroundable {     //Play Audio In Background
  if(kEnable && kPlayBackground) {
    return 1;
  }
  return %orig;
}
%end

%hook YTPlaybackData
-(bool)isPlayableInBackground {        //Play Audio In Background
  if(kEnable && kPlayBackground) {
    return 1;
  }
  return %orig;
}
%end

%hook YTLocalPlaybackController
-(bool)isPlaybackBackgroundable {      //Play Audio In Background
  if(kEnable && kPlayBackground) {
    return 1;
  }
  return %orig;
}
%end

%hook YTContentVideoPlayerOverlayView
-(void)setRelatedVideosOverlayView:(id)arg1 {    //Always Show Player Bar, Hide Related Videos
  if(kEnable && (kShowPlayerBar || kHideRelatedVideos)) {
  }
  return %orig;
}
%end

%hook YTContentVideoPlayerOverlayViewController
-(void)adjustPlayerBarPositionForRelatedVideos { //Always Show Player Bar
  if(kEnable && kShowPlayerBar) {
  }
  return %orig;
}

-(void)setCreatorEndscreenViewController:(id)arg1 {
  if(kEnable && kHideCreatorEndScreen) {         //Hide Creator's Endscreen View
  }
  return %orig;
}
%end

%hook YTPlayerBarController
-(void)setPlayerViewLayout:(int)arg1 {           //Always Show Player Bar
  if(kEnable && kShowPlayerBar) {
    arg1 = 0;
    %orig;
  }
  return %orig;
}
%end

//Loading Plist File of Mini Youtube Tools
static void loadPrefs()
{
  NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.peterdev.miniyoutubetools.plist"];
  if(prefs)
  {
    kEnable = [[prefs objectForKey:@"kEnable"] boolValue];
    kNoAds = [[prefs objectForKey:@"kNoAds"] boolValue];
    kPlayBackground = [[prefs objectForKey:@"kPlayBackground"] boolValue];
    kShowPlayerBar = [[prefs objectForKey:@"kShowPlayerBar"] boolValue];
    kHideRelatedVideos = [[prefs objectForKey:@"kHideRelatedVideos"] boolValue];
    kHideCreatorEndScreen = [[prefs objectForKey:@"kHideCreatorEndScreen"] boolValue];
  }
  [prefs release];
}

%ctor {
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.peterdev.miniyoutubetools/settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
  loadPrefs();
}
