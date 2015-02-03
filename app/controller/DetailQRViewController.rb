class DetailQRViewController < UIViewController
  extend IB
  outlet :qrTextView, UITextView

  attr_accessor :qr_text

  def viewDidLoad
    super
    self.navigationController.navigationBar.translucent = false
    setup_elements
  end

  def setup_elements
    qrTextView.setText(@qr_text)
  end

end