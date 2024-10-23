source 'https://github.com/CocoaPods/Specs.git'

# Uncomment the next line to define a global platform for your project
platform :ios, '16.0'

target 'SurveyWithRK' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SurveyWithRK
  pod 'ResearchKit', :git =>'https://github.com/ResearchKit/ResearchKit.git', :tag => '1.5.2'
  pod 'Mantle'
  pod 'Realm', '~>10.54.0' #  :git =>'https://github.com/realm/realm-swift.git'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '16.0'
    end
  end
end
