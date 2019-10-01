PLATFORM='firefox'

# https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/Native_manifests#Manifest_location
case $(uname -s) in
  Darwin)
    TARGET="$HOME/Library/Application Support/Mozilla/NativeMessagingHosts"
    ;;
  Linux)
    TARGET="$HOME/.mozilla/native-messaging-hosts"
    ;;
esac
