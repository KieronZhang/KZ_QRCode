
Pod::Spec.new do |s|

    s.name = 'KZ_QRCode'
    s.version = '0.1'
    s.summary = 'iOS QRCode.'
    s.homepage = 'https://github.com/KieronZhang/KZ_QRCode'
    s.license = {:type => 'MIT', :file => 'LICENSE'}
    s.author = {'KieronZhang.' => 'https://github.com/KieronZhang'}
    s.platform = :ios, '8.0'
    s.source = {:git => 'https://github.com/KieronZhang/KZ_QRCode.git', :tag => s.version, :submodules => true}
    s.xcconfig = {'OTHER_LDFLAGS' => '-ObjC'}
    s.frameworks = 'Foundation', 'AVFoundation'
    s.vendored_frameworks = 'KZ_QRCode/KZ_QRCodeFramework.framework'
    s.requires_arc = true

end
