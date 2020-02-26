# Shell for [Chrome] and [Firefox]

[Chrome]: https://google.com/chrome/
[Firefox]: https://mozilla.org/firefox/

Chrome API to execute external commands through [native messaging].

[Native messaging]: https://developer.chrome.com/extensions/nativeMessaging

## Dependencies

- [Crystal]
- [Docker] (for static builds)
- [jq]
- [Zip]

[Crystal]: https://crystal-lang.org
[Docker]: https://docker.com
[jq]: https://stedolan.github.io/jq/
[Zip]: http://infozip.sourceforge.net/Zip.html

## Installation

1. [Host](host)
2. [Extension](extension)

## Usage

``` javascript
// Environment variables
switch (true) {
  case (typeof browser !== 'undefined'):
    var PLATFORM = 'firefox'
    var SHELL_EXTENSION_ID = 'shell@alexherbo2.github.com'
    break
  case (typeof chrome !== 'undefined'):
    var PLATFORM = 'chrome'
    var SHELL_EXTENSION_ID = 'ohgecdnlcckpfnhjepfdcdgcfgebkdgl'
    break
}

// Initialization
const shell = {}
shell.port = chrome.runtime.connect(SHELL_EXTENSION_ID)
shell.send = (command, ...arguments) => {
  shell.port.postMessage({ command, arguments })
}

// Usage
shell.send('mpv', 'https://youtu.be/7ky_itVPTnk')
```

You can find some examples in [Krabby].

[Krabby]: https://krabby.netlify.com

See the [source](host/src) for a complete reference.

## API

###### Request

``` crystal
{
  id: String?,
  command: String,
  arguments: Array(String)?,
  environment: Hash(String, String)?,
  shell: { type: Bool, default: false },
  input: String?,
  directory: String?
}
```

###### Response

``` crystal
{
  id: String?,
  status: Int32,
  output: String,
  error: String
}
```
