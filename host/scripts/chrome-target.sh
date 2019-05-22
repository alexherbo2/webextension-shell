XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# https://developer.chrome.com/extensions/nativeMessaging#native-messaging-host-location
case $(uname -s) in
  Darwin)
    TARGET="$HOME/Library/Application Support/Google/Chrome/NativeMessagingHosts"
    ;;
  Linux)
    TARGET="$XDG_CONFIG_HOME/google-chrome/NativeMessagingHosts"
    ;;
esac
