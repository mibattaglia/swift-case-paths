Pod::Spec.new do |s|
  s.name           = 'CasePathsCore'
  s.version        = '0.1.0'
  s.summary        = 'Core case path utilities'
  s.description    = 'CasePaths core runtime module for Swift 6'
  s.author         = 'Point-Free'
  s.homepage       = 'https://github.com/pointfreeco/swift-case-paths'
  s.license        = { type: 'MIT', file: 'LICENSE' }
  s.platforms      = { ios: '13.0', macos: '10.15', tvos: '13.0', watchos: '6.0' }
  s.source         = { git: 'https://github.com/mibattaglia/swift-case-paths.git', tag: s.version.to_s }
  s.swift_version  = '6.0'

  s.static_framework = true
  s.source_files = 'Sources/CasePathsCore/**/*.swift'
end
