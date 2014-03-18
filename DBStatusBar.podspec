Pod::Spec.new do |s|
  s.name             = "DBStatusBar"
  s.version          = "0.0.1"
  s.summary          = "DBStatusBar provides a custom popover window appearing from an icon in the Mac OS X menu bar."
  s.homepage         = "https://github.com/dbainbridge/DBStatusBar.git"
  s.license          = 'BSD'
  s.authors           = 'David Bainbridge', 'Vadim Shpakovski'
  s.source           = { :git => "https://github.com/dbainbridge/DBStatusBar.git", :tag => s.version.to_s }

  s.platform     = :osx, '10.9'
  s.requires_arc = true

  s.source_files = 'DBStatusBar'

  s.frameworks = 'Cocoa'
end