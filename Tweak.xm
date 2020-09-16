#import <substrate.h>

@interface _TtC9KakaoTalk26MoreHomeCarouselBannerCell
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@property (nonatomic, assign, readwrite) CGRect frame;
-(void)removeFromSuperview;
@end

@interface _TtC9KakaoTalk20MoreHomeNativeAdCell
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@property (nonatomic, assign, readwrite) CGRect frame;
-(void)removeFromSuperview;
@end


@interface _TtC9KakaoTalk15MoreWeatherCell
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@property (nonatomic, assign, readwrite) CGRect frame;
-(void)removeFromSuperview;
@end

@interface _TtC9KakaoTalk20ChatsAdTableViewCell
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@property (nonatomic, assign, readwrite) CGRect frame;
-(void)removeFromSuperview;
@end

@interface _TtC9KakaoTalk18CreateChatMenuView : UIView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end


%hook KakaoTalk_MoreHomeViewController
-(void) nativeAdLoaderDidReceiveAd:(id)arg1 {
	;
}
%end

%hook KakaoTalk_SRNativeAdContainer
-(void) nativeAdLoaderDidReceiveAd:(id)arg1 {
	;
}
%end

%hook KakaoTalk_PlusFriendDataController
-(void) nativeAdLoaderDidReceiveAds:(id)arg1 {
	;
}
%end

%hook AdFit_AdFitBannerAdView
-(CGRect) frame {
	return CGRectMake(0, 0, 0, 0);
}

%end

%hook AdFit_TalkAdProvider 
-(void) nativeAdLoaderDidReceiveAd:(id)arg1 {
	;
}
%end




%hook _TtC9KakaoTalk26MoreHomeCarouselBannerCell
-(void) layoutSubviews {
//[self removeFromSuperview];

	self.hidden = YES;


}

%end

%hook _TtC9KakaoTalk20MoreHomeNativeAdCell
-(void) layoutSubviews {

[self removeFromSuperview];

}
%end



%hook _TtC9KakaoTalk15MoreWeatherCell
-(void) layoutSubviews {
	self.frame = CGRectMake(0, 0, 0, 0);
	self.hidden = YES;
[self removeFromSuperview];
}
%end


%hook _TtC9KakaoTalk20ChatsAdTableViewCell
-(void) layoutSubviews {
	self.frame = CGRectMake(0, 0, 0, 0);
	self.hidden = YES;
[self removeFromSuperview];
}
%end

%hook _TtC9KakaoTalk18CreateChatMenuView
-(void) layoutSubviews {
	UIView *openChatBannerContainerView = MSHookIvar<UIView *>(self, "openChatBannerContainerView");
	UIView *openChatBannerView = MSHookIvar<UIView *>(self, "openChatBannerView");
	openChatBannerContainerView.hidden = YES;
	openChatBannerView.hidden = YES;
}
%end


%hook _TtC9KakaoTalk35GlobalSearchRecommendViewController
-(void)viewDidLoad {
	;
}
%end


%hook _TtC9KakaoTalk22MoreHomeViewController
-(long long)numberOfSectionsInCollectionView:(id)arg1 {
	%orig;
	return 3;
}
%end


%ctor
{
    @autoreleasepool
    {	
	%init(KakaoTalk_MoreHomeViewController = NSClassFromString(@"KakaoTalk.MoreHomeViewController"),
	KakaoTalk_SRNativeAdContainer= NSClassFromString(@"KakaoTalk.SRNativeAdContainer"),
	KakaoTalk_PlusFriendDataController = NSClassFromString(@"KakaoTalk.PlusFriendDataController"),

	AdFit_AdFitBannerAdView = NSClassFromString(@"AdFit.AdFitBannerAdView"),
	AdFit_TalkAdProvider = NSClassFromString(@"AdFit.TalkAdProvider"));

    }
}

