
Pod::Spec.new do |s|



  s.name         = "AXUserInfo"
  s.version      = "0.0.2"
  s.summary      = "A 玩转组件化-个人用户"

 s.description  = <<-DESC
			
			玩转组件化，写的一个个人中心页面，用于调试
                   DESC

  s.homepage     = "https://github.com/GG-beyond/AXUserInfo"


  s.license      = "MIT"

  s.author             = { "GG-beyond" => "872608550@qq.com" }

  s.platform     = :ios
  s.ios.deployment_target = "8.0"

  s.source       = { :git => "https://github.com/GG-beyond/AXUserInfo.git", :tag => "0.0.2" }

#  s.source_files  = "Classes", "Classes/**/*.{h,m}"

    s.subspec 'Models' do |mod|

        mod.source_files =  'AXUserInfo/AXUserInfo/Models/*.{h,m}'
    end

    s.subspec 'ViewModels' do |vm|

        vm.source_files =  'AXUserInfo/AXUserInfo/ViewModels/*.{h,m}'
        vm.dependency 'AXUserInfo/Models'


    end

    s.subspec 'ViewControllers' do |shared|

        shared.source_files =  'AXUserInfo/AXUserInfo/ViewControllers/*.{h,m}'
        shared.dependency 'AXUserInfo/ViewModels'

    end



  s.exclude_files = "Classes/Exclude"
  s.prefix_header_file = "AXUserInfo/AXGlobal.h"


 

end
