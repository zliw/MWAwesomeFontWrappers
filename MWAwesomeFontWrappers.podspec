Pod::Spec.new do |s|
  s.name             = "MWAwesomeFontWrappers"
  s.version          = "0.1.0"
  s.summary          = "a UIView subclass managing a group of buttons"
  s.description      = <<-DESC
                       MWAwesomeFontWrappers is a collection of subclasses for providing configuration
                       of Font Awesome icons in Interface Builder by misusing title attributes of the class
                       in question. Currently supported are UIBarButtonItem and UITabBarItem.
                       DESC
  s.homepage         = "https://github.com/zliw/MWAwesomeFontWrappers"
  s.screenshots      = "https://raw.githubusercontent.com/zliw/MWAwesomeFontWrappers/master/screenshot.png"
  s.license          = 'MIT'
  s.author           = { "Martin Wilz" => "github@wilz.de" }
  s.source           = { :git => "https://github.com/zliw/MWAwesomeFontWrappers.git", :tag => "0.1.0" }

  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.dependency 'FontAwesomeKit/FontAwesome', '~> 2.1.0'

  s.source_files = 'Classes'

  s.public_header_files = 'Classes/*.h'
end
