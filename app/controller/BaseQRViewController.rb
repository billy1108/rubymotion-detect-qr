class BaseQRViewController < UIViewController
  extend IB
  outlet :messageLabel, UILabel

  def viewDidLoad
    super
    self.navigationController.navigationBar.translucent = false
    setup_elements
  end

  def setup_elements
    
  end

  def scanAction id
    reader = QRCodeReaderViewController.new()
    reader.modalPresentationStyle = UIModalPresentationFormSheet

    reader.delegate = self

    self.presentViewController(reader, animated:true, completion:nil)
  end

#pragma mark - QRCodeReader Delegate Methods

def reader reader, didScanResult: result
    self.dismissViewControllerAnimated(true, completion:nil)
end

def reader reader, readerDidCancel: reader
  self.dismissViewControllerAnimated(true, completion:nil)
end



end
