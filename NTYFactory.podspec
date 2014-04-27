Pod::Spec.new do |s|
  s.name             = "NTYFactory"
  s.version          = "0.1.0"
  s.summary          = "Data bootstrapping factory for Core Data"
  s.description      = <<-DESC
                     NTYFactory makes it easy to bootstrap data by Core Data.
                     DESC
  s.homepage         = "https://github.com/naoty/NTYFactory"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Naoto Kaneko" => "naoty.k@gmail.com" }
  s.social_media_url = "https://twitter.com/naoty_k"
  s.source           = { :git => "https://github.com/naoty/NTYFactory.git", :tag => s.version.to_s }
  s.source_files     = "Classes"
  s.frameworks       = "CoreData"
  s.requires_arc     = true
end
