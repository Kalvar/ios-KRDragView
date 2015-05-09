Pod::Spec.new do |s|
  s.name         = "KRDragView"
  s.version      = "0.8"
  s.summary      = "Drag, move, swipe, slide the view, also can implement the crads effect."
  s.description  = <<-DESC
                   KRDragView simulates dragging and sliding the view to show the menu under background. Like the cards, you could drag the view and release it to move/ show something under itself.
                   DESC
  s.homepage     = "https://github.com/Kalvar/ios-KRDragView"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Kalvar Lin" => "ilovekalvar@gmail.com" }
  s.social_media_url = "https://twitter.com/ilovekalvar"
  s.source       = { :git => "https://github.com/Kalvar/ios-KRDragView.git", :tag => s.version.to_s }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.public_header_files = 'KRDragView/*.h'
  s.source_files = 'KRDragView/KRDragView.h'
  s.frameworks   = 'UIKit', 'Foundation', 'CoreGraphics'
end 