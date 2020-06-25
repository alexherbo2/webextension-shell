# Environment variables
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

PLATFORM='chrome'

# Native messaging host location
# Undocumented
# Unchecked runtime.lastError: Specified native messaging host not found.
case $(uname -s) in
  Darwin)
    TARGET="$HOME/Library/Application Support/BraveSoftware/Brave-Browser/NativeMessagingHosts"
    ;;
  Linux)
    TARGET="$XDG_CONFIG_HOME/BraveSoftware/Brave-Browser/NativeMessagingHosts"
    ;;
esac
