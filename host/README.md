# Host

###### [Chrome](#chrome) | [Firefox](#firefox)

## Dependencies

- [Crystal]
- [Docker] (for static builds)
- [jq]

## Installation

### Chrome

Build the application and install the [native manifest][Native messaging host] to its [appropriate location][Native messaging host location]:

``` sh
make chrome
make chromium
```

### Firefox

Build the [application](host) and install the [native manifest][Firefox – Native manifests] to its [appropriate location][Firefox – Native manifest location]:

``` sh
make firefox
```

[Crystal]: https://crystal-lang.org
[Docker]: https://docker.com
[jq]: https://stedolan.github.io/jq/
[Native messaging host]: https://developer.chrome.com/extensions/nativeMessaging#native-messaging-host
[Native messaging host location]: https://developer.chrome.com/extensions/nativeMessaging#native-messaging-host-location
[Firefox – Native manifests]: https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/Native_manifests
[Firefox – Native manifest location]: https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/Native_manifests#Manifest_location
