class BloodborneController < UIViewController

  def init
    super
    self.tabBarItem = UITabBarItem.alloc.init
    self.tabBarItem.title = "Bloodborne"

    selected = UIImage.imageNamed("bloodborne-on.png").imageWithRenderingMode(UIImageRenderingModeAlwaysOriginal)
    unselected = UIImage.imageNamed("bloodborne.png").imageWithRenderingMode(UIImageRenderingModeAlwaysOriginal)
    self.tabBarItem.setFinishedSelectedImage(selected, withFinishedUnselectedImage: unselected)

    self
  end

  def loadView
    self.view = UIWebView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    view.delegate = web_view_delegate
  end

  def viewDidLoad
    super
    self.title = "Bloodborne"

    # To set a control, this isn't cached
    LoadWebView.new(self, "#{AppDelegate::WEB_APPLICATION_URL}/bloodborne").request_and_load # cache and headers
  end

  private

  def web_view_delegate
    @web_view_delegate = WebResponseDelegate.alloc.initWithOwner(self, 'main')
  end

end
