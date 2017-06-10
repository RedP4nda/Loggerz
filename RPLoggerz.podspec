Pod::Spec.new do |s|
  s.name             = 'RPLoggerz'
  s.version          = '0.9'
  s.summary          = 'Addd Logging capabilities to your app with RPLoggerz.'

  s.description      = <<-DESC
Contains various loggers with different purposes: Dotzu, SwiftyBeaver, JustLog, CrashlyticsLogger, WatchDog.
                       DESC

  s.homepage         = 'https://github.com/RedP4nda/RPLoggerz'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'MrCloud' => 'florianp37@me.com' }
  s.source           = { :git => 'https://github.com/RedP4nda/RPLoggerz.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/Florian_MrCloud'


  s.ios.deployment_target = '9.0'

  s.source_files = 'RPLoggerz/Classes/Core/**/*'
  s.default_subspec = 'Core'

  s.subspec 'Core' do |a|
    a.source_files = 'RPLoggerz/Classes/Core/**/*'
  end

  s.subspec 'CrashlyticsLogger' do |a|
    a.source_files = 'RPLoggerz/Classes/CrashlyticsLogger/**/*'
    a.dependency 'RPLoggerz/Core'
    a.dependency 'CrashlyticsRecorder', '2.1.0'
    a.xcconfig =  { 'OTHER_SWIFT_FLAGS' => '$(inherited) -DRPLoggerzCrashlyticsLogger' }
  end

  s.subspec 'Watchdog' do |a|
    a.source_files = 'RPLoggerz/Classes/Watchdog/**/*'
    a.dependency 'RPLoggerz/Core'
    a.dependency 'Watchdog', '3.0'
    a.xcconfig =  { 'OTHER_SWIFT_FLAGS' => '$(inherited) -DRPLoggerzWatchdog' }
  end

  s.subspec 'Dotzu' do |a|
    a.source_files = 'RPLoggerz/Classes/Dotzu/**/*'
    a.dependency 'RPLoggerz/Core'
    a.dependency 'Dotzu', '1.8'
    a.xcconfig =  { 'OTHER_SWIFT_FLAGS' => '$(inherited) -DRPLoggerzDotzu' }
  end

  s.subspec 'SwiftyBeaver' do |a|
    a.source_files = 'RPLoggerz/Classes/SwiftyBeaver/**/*'
    a.dependency 'RPLoggerz/Core'
    a.dependency 'SwiftyBeaver', '1.1.4'
    a.xcconfig =  { 'OTHER_SWIFT_FLAGS' => '$(inherited) -DRPLoggerzSwiftyBeaver' }
  end

  s.subspec 'JustLog' do |a|
    a.source_files = 'RPLoggerz/Classes/JustLog/**/*'
    a.dependency 'RPLoggerz/Core'
    a.dependency 'JustLog', '1.1.2'
    a.xcconfig =  { 'OTHER_SWIFT_FLAGS' => '$(inherited) -DRPLoggerzJustLog' }
  end
end
