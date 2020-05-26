Pod::Spec.new do |s|
s.name         = "WKCVisionManager"
s.version      = "1.2.0"
s.summary      = "face vision manager"
s.homepage     = "https://github.com/WKCLoveYang/WKCVisionManager.git"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = { "WKCLoveYang" => "wkcloveyang@gmail.com" }
s.platform     = :ios, "11.0"
s.source       = { :git => "https://github.com/WKCLoveYang/WKCVisionManager.git", :tag => "1.2.0" }
s.source_files  = "WKCVisionManager/**/*.{h,m}"
s.public_header_files = "WKCVisionManager/**/*.h"
s.frameworks = "Foundation", "UIKit"
s.requires_arc = true

end
