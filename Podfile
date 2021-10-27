# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
workspace 'ReduxModularizationPOC'

target 'ReduxModularizationPOC' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'ReSwift'

  target "Counter" do
    project 'Counter/Counter.xcodeproj'
    inherit! :search_paths
  end

  target "Room" do
    project 'Room/Room.xcodeproj'
    inherit! :search_paths
  end
end
