Pod::Spec.new do |s|
  s.name         = "MYEntry+Sqlite"
  s.version      = "1.0"
  s.summary      = "Sqlite extend of MYEntry."
  s.homepage     = "https://github.com/Whirlwind/MYEntry-Sqlite"
  s.license      = 'MIT'
  s.author       = { "Whirlwind" => "Whirlwindjames@foxmail.com" }
  s.source       = { :git => "https://github.com/Whirlwind/MYEntry-Sqlite.git", :tag=>'v1.0'}
  s.platform     = :ios, '5.0'
  s.source_files = 'MYEntry+Sqlite/MYEntry+Sqlite/Shared/**/*.{h,m}'
  s.resources = "MYEntry+Sqlite/MYEntry+Sqlite/Shared/**/*.{broadcast,route}"
  s.frameworks = 'UIKit', 'Foundation'
  s.prefix_header_file = 'MYEntry+Sqlite/MYEntry+Sqlite/Shared/MYEntry+Sqlite-SharedPrefix.pch'
  s.requires_arc = true

  s.dependency 'MYEntry'
  s.dependency 'FMDB', '>= 2.0.2'
  # s.dependency 'ASIHTTPRequest/Basic'
  # s.dependency 'JSONAPI'
  # s.dependency 'BHAnalysis'
  # s.dependency 'MTStatusBarOverlay'
end
