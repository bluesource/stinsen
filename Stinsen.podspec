Pod::Spec.new do |spec|
    spec.name         = 'Stinsen'
    spec.version      = '1.0.5'
    spec.license      = { :type => 'MIT License' }
    spec.homepage     = 'https://github.com/rundfunk47/stinsen'
    spec.authors      = { 'Narek Mailian' => 'narek.mailian@gmail.com' }
    spec.summary      = 'Simple, powerful and elegant implementation of the Coordinator pattern in SwiftUI. Stinsen is written using 100% SwiftUI which makes it work seamlessly across iOS, tvOS, watchOS and macOS devices. The library is developed during working hours for the Byva app.'
    spec.source       = { :git => 'https://github.com/rundfunk47/stinsen.git' }
    spec.source_files = 'Sources/**/*.swift'
    spec.framework    = 'SwiftUI'
    spec.ios.deployment_target  = '13.0'
    spec.swift_version = '5.3'
    spec.dependency 'Resolver'
  end
