RPLoggerz
============

[![Build Status](https://travis-ci.org/RedP4nda/RPLoggerz.svg?branch=master)](https://travis-ci.org/RedP4nda/RPLoggerz)
[![Twitter](https://img.shields.io/badge/twitter-@Florian_MrCloud-blue.svg?style=flat)](http://twitter.com/Florian_MrCloud)

# Disclaimer:

- This program is still under active development and in its early stage, consider that breaking changes and rewrites could occur before using it in a stable version.


RPLoggerz is a library with various logging utilities.

- [Features](#features)
- [The Basics](#the-basics)
- [To Do](#to-do)
- [Contributing](#contributing)
- [Installation](#installation)

# Features:

- CrashlyticsLogger powered by([CrashlyticsRecorder](https://github.com/AnthonyMDev/CrashlyticsRecorder))
- [Watchdog](https://github.com/wojteklu/Watchdog)
- [Dotzu](https://github.com/remirobert/Dotzu)
- [SwiftyBeaver](https://github.com/SwiftyBeaver/SwiftyBeaver)
- [JustLog](https://github.com/justeat/JustLog)


# The Basics
RPLoggerz helps you use various logging features to your project, by adding the different subspecs provided, thus this project is highly dependent on CocoaPods.


# CrashlyticsLogger

Install by adding the following lines in your Podfile:
```ruby
source 'https://github.com/RedP4nda/RPLoggerz'

pod 'RPLoggerz/CrashlyticsLogger', '~> 1.0'
```

Usage:
```swift
// AppDelegate.swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    Fabric.with([Crashlytics.self])
    CrashlyticsLoggerManager.configure()
    CrashlyticsLoggerManager.setupCrashlyticsRecorder(crashlytics: Crashlytics.sharedInstance())

    return true
}
```

Then you can add this anywhere:
```swift
CrashlyticsLoggerManager.logMessage("message", logLevel: .verbose)
```

Which will result into adding the message to the crash logs gathered by the crashlytics platform:

<img src="./docs/images/crashlog.png" width="1000" height="568" />


# Watchdog

`Logging excessive blocking on the main thread`

Install by adding the following lines in your Podfile:
```ruby
source 'https://github.com/RedP4nda/Specs'

pod 'RPLoggerz/Watchdog', '~> 1.0'
```

Usage:
```swift
WatchdogManager.configure()
```

# Dotzu

`In-App iOS Debugging Tool With Enhanced Logging, Networking Info, Crash reporting And More.`

Install by adding the following lines in your Podfile:
```ruby
source 'https://github.com/RedP4nda/Specs'

pod 'RPLoggerz/Dotzu', '~> 1.0'
```

Usage:
```swift
DotzuLoggerManager.configure()

...
DotzuLoggerManager.logMessage("message", logLevel: .verbose)
```

# SwiftyBeaver

`Convenient logging during development & release in Swift 2 & 3`

Install by adding the following lines in your Podfile:
```ruby
source 'https://github.com/RedP4nda/Specs'

pod 'RPLoggerz/SwiftyBeaver', '~> 1.0'
```

Usage:
```swift
```

# JustLog

`JustLog brings logging on iOS to the next level. It supports console, file and remote Logstash logging via TCP socket with no effort. Support for logz.io available.`

Install by adding the following lines in your Podfile:
```ruby
source 'https://github.com/RedP4nda/Specs'

pod 'RPLoggerz/JustLog', '~> 1.0'
```

Usage:
```swift
JustLogManager.configure()

...
JustLogManager.logMessage("message", logLevel: .verbose)

let error = MessageError.SimpleError("Error Occured")
JustLogManager.logMessage("message", logLevel: .error, error: error)
```

# To Do
- Enable/configure Alamofire/URLSession capabilities to DotzuLoggerManager

# Installation
### Cocoapods
RPLoggerzImageLoader can be added to your project using [CocoaPods](http://cocoapods.org) by adding the following lines to your `Podfile`:

```ruby
source 'https://github.com/RedP4nda/Specs'

pod 'RPLoggerz/CrashlyticsLogger', '~> 1.0'
pod 'RPLoggerz/Watchdog', '~> 1.0'
pod 'RPLoggerz/Dotzu', '~> 1.0'
pod 'RPLoggerz/SwiftyBeaver', '~> 1.0'
pod 'RPLoggerz/JustLog', '~> 1.0'
```

## Contributors
[![MrCloud](https://avatars2.githubusercontent.com/u/486140?s=100)](https://github.com/MrCloud)

# Contributing

Contributions are very welcome 👍😃.

Before submitting any pull request, please ensure you have run the included tests (if any) and they have passed. If you are including new functionality, please write test cases for it as well.
