source 'https://github.com/CocoaPods/Specs.git'

# Uncomment the next line to define a global platform for your project
platform :ios, '16.0'

target 'SurveyWithRK' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SurveyWithRK
  pod 'ResearchKit', '~>2.2.16' #  :git =>'https://github.com/ResearchKit/ResearchKit.git'
  pod 'Mantle'
  pod 'Realm'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '16.0'
    end
  end
end
