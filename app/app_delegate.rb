class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    launch
    true
  end

  def launch
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @storyboard = UIStoryboard.storyboardWithName("DetectQR", bundle:nil)
    @window.rootViewController = @storyboard.instantiateInitialViewController

    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
  end

end
