class BaseQRViewController < UIViewController
  extend IB
  outlet :messageLabel, UILabel

  def viewDidLoad
    super
    self.navigationController.navigationBar.translucent = false
    setup_elements
  end

  def setup_elements
    @supportedBarCodes = [AVMetadataObjectTypeQRCode, AVMetadataObjectTypeCode128Code, AVMetadataObjectTypeCode39Code, AVMetadataObjectTypeCode93Code, AVMetadataObjectTypeUPCECode, AVMetadataObjectTypePDF417Code, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeAztecCode]

    captureDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
    NSLog("captureDevice==> #{captureDevice.inspect}")
    error = nil
    input = AVCaptureDeviceInput.deviceInputWithDevice(captureDevice, error: error)
    if (error != nil)
      return
    end
    captureSession = AVCaptureSession.new()
    NSLog("input ==> #{input.inspect}")
    captureSession.addInput(input)
    captureMetadataOutput = AVCaptureMetadataOutput.new()
    captureSession.addOutput(captureMetadataOutput)
    captureMetadataOutput.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
    captureMetadataOutput.metadataObjectTypes = @supportedBarCodes

    @videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
    @videoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
    @videoPreviewLayer.frame = view.layer.bounds
    view.layer.addSublayer(@videoPreviewLayer)

    captureSession.startRunning
    view.bringSubviewToFront(messageLabel)

    @qrCodeFrameView = UIView()
    @qrCodeFrameView.layer.borderColor = UIColor.greenColor().CGColor
    @qrCodeFrameView.layer.borderWidth = 2
    view.addSubview(@qrCodeFrameView)
    view.bringSubviewToFront(@qrCodeFrameView)        
  end

  #MARK :- DELEGATE
  def captureOutput(captureOutput, didOutputMetadataObjects: metadataObjects, fromConnection: connection)  
    if metadataObjects == nil || metadataObjects.count == 0 
      @qrCodeFrameView.frame = CGRectZero
      messageLabel.text = "No QR code is detected"
      return
    end
        
    metadataObj = metadataObjects[0]
    if @supportedBarCodes.include?(metadataObj.type)
      barCodeObject = @videoPreviewLayer.transformedMetadataObjectForMetadataObject(metadataObj)
      @qrCodeFrameView.frame = barCodeObject.bounds
      
      if metadataObj.stringValue != nil 
        messageLabel.text = metadataObj.stringValue
      end
    end
  end

end