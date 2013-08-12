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
  s.prefix_header_contents = %(
// =========== MYEntry+Sqlite ==========
#ifdef __OBJC__
#   import "MYFramework.h"
#   import "MYEntry.h"
#   import "FMDatabase+MYAdditions.h"
#endif)
  s.requires_arc = true

  s.dependency 'MYEntry'
  s.dependency 'FMDB', '2.0.3'
end
