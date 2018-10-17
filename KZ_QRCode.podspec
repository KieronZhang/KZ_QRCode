
Pod::Spec.new do |s|

    s.name = 'KZ_QRCode'
    s.version = '0.1.2'
    s.summary = 'iOS QRCode.'
    s.homepage = 'https://github.com/KieronZhang/KZ_QRCode'
    s.license = {:type => 'MIT', :file => 'LICENSE'}
    s.author = {'KieronZhang' => 'https://github.com/KieronZhang'}

    s.source = {:git => 'https://github.com/KieronZhang/KZ_QRCode.git', :tag => s.version, :submodules => true}
    s.xcconfig = {'OTHER_LDFLAGS' => '-ObjC'}
    s.requires_arc = true

    s.ios.frameworks = 'Foundation', 'UIKit', 'AVFoundation'

    s.ios.deployment_target = '8.0'

    s.ios.vendored_frameworks = 'KZ_QRCode/KZ_QRCode_iOS.framework'

end
