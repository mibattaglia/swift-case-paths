Pod::Spec.new do |s|
  s.name           = 'CasePaths'
  s.version        = '0.0.0' # TODO: replace with the release tag you ship
  s.summary        = 'Case paths for enums with macro support'
  s.description    = 'CasePaths runtime + macros (prebuilt plugin) for Swift 6'
  s.author         = 'Point-Free'
  s.homepage       = 'https://github.com/pointfreeco/swift-case-paths'
  s.license        = { type: 'MIT', file: 'LICENSE' }
  s.platforms      = { ios: '13.0', macos: '10.15', tvos: '13.0', watchos: '6.0' }
  s.source         = { git: 'https://github.com/pointfreeco/swift-case-paths.git', tag: s.version.to_s }
  s.swift_version  = '6.0'

  s.static_framework = true

  # Preserve the prebuilt macro binary (you provide this at release time)
  s.preserve_paths = ['Macros/CasePathsMacros']

  # Configure build flags to load the macro plugin
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'OTHER_SWIFT_FLAGS' => '-load-plugin-executable ${PODS_TARGET_SRCROOT}/Macros/CasePathsMacros#CasePathsMacros'
  }

  # For the main app target (if it uses macros directly)
  s.user_target_xcconfig = {
    'OTHER_SWIFT_FLAGS' => '-load-plugin-executable $(PODS_ROOT)/Development\\ Pods/CasePaths/Macros/CasePathsMacros#CasePathsMacros'
  }

  s.subspec 'Core' do |ss|
    ss.module_name = 'CasePathsCore'
    ss.source_files = 'Sources/CasePathsCore/**/*.swift'
  end

  s.subspec 'CasePaths' do |ss|
    ss.module_name = 'CasePaths'
    ss.source_files = 'Sources/CasePaths/**/*.swift'
    ss.dependency 'CasePaths/Core'
  end
end
