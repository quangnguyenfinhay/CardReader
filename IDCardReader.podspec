Pod::Spec.new do |spec|

  spec.name         = "IDCardReader"
  spec.version      = "1.0.47"
  spec.summary      = "This package handles reading an NFC Enabled passport using iOS 13 CoreNFC APIS"

  spec.homepage     = "https://github.com/trungnguyen1791/CardReader"
  spec.author           = { 'My Name' => 'myemail@example.com' }
  spec.license      = "MIT"
  spec.platform = :ios
  spec.ios.deployment_target = "11.0"

  spec.source            = { :http => 'https://github.com/trungnguyen1791/CardReader/releases/download/1.0.47/IDCardReader.zip' }
  # spec.weak_frameworks = ['CoreNFC']
  spec.default_subspecs = ["Full"]

  spec.subspec 'Full' do |subspec|
    subspec.vendored_frameworks = 'IDCardReader/Full/IDCardReader.xcframework'
    subspec.dependency "ObjectMapper", '~> 4.2'
    subspec.dependency "OpenSSL-Universal", '1.1.1100'
  end

  spec.subspec 'Lite' do |subspec|
    subspec.vendored_frameworks = 'IDCardReader/Lite/IDCardReader.xcframework'
    subspec.dependency "ObjectMapper", '~> 4.2'
    subspec.dependency "OpenSSL-Universal", '1.1.1100'
  end


  spec.swift_version = "5.0"
  spec.xcconfig          = { 'OTHER_LDFLAGS' => '-weak_framework CryptoKit -weak_framework CoreNFC -weak_framework CryptoTokenKit' }
  spec.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

end
