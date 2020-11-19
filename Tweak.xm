#import <substrate.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// 채팅 탭 상단에 있는 광고 지우기
BOOL shouldHookForRemoveChattingTabAD = false;
%hook KakaoTalk_ChatsTableViewController
-(double)tableView: (id)arg1 heightForRowAtIndexPath: (id)arg2 {
	shouldHookForRemoveChattingTabAD = true;
	return %orig;
}
%end

%hook UIDevice
+(BOOL)isPad {
	if(shouldHookForRemoveChattingTabAD) {
		shouldHookForRemoveChattingTabAD = false;
		return true;
	}
	return %orig;
}
%end

//더보기 탭에 있는 하단의 여러 부가 기능 지우기
%hook KakaoTalk_MoreHomeViewController
-(void) nativeAdLoaderDidReceiveAd: (id)arg1 {
	;
}
-(long long)numberOfSectionsInCollectionView: (id)arg1 {
	return %orig - 4;
}
%end

//채팅 탭에서 새로운 채팅(상단 우측의 두번째로 앞에 있는 챗+ 모양 버튼)을 시작하려고 할 때 오픈채팅 인기키워드 추천 지우기
%hook KakaoTalk_CreateChatMenuView
-(void) layoutSubviews {
	UIView *openChatBannerContainerView = MSHookIvar<UIView *>(self, "openChatBannerContainerView");
	UIView *openChatBannerView = MSHookIvar<UIView *>(self, "openChatBannerView");
	openChatBannerContainerView.hidden = YES;
	openChatBannerView.hidden = YES;
}
%end

%ctor
{
	@autoreleasepool
	{
		%init(KakaoTalk_ChatsTableViewController = NSClassFromString(@"KakaoTalk.ChatsTableViewController"),
		      KakaoTalk_MoreHomeViewController = NSClassFromString(@"KakaoTalk.MoreHomeViewController"),
		      KakaoTalk_CreateChatMenuView = NSClassFromString(@"KakaoTalk.CreateChatMenuView"));

		//MSHookFunction(MSFindSymbol(NULL, "_$s5AdFit014BizBoardNativeA0C08isHiddenA0Sbvg"), (void *)ret1, (void **)&orig_ret);
	}
}
