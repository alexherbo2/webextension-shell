# Shell for [Chrome]

> Chrome API to execute external commands through [native messaging].

## Dependencies

- [Crystal]
- [jq]
- [Inkscape] (Inkscape is used to convert SVG to PNG)

## Installation

### Installing from the Chrome Web Store

https://chrome.google.com/webstore/detail/shell/ohgecdnlcckpfnhjepfdcdgcfgebkdgl

### Installing from the source

#### Extension

``` sh
cd extension
make
```

Open the _Extensions_ page by navigating to `chrome://extensions`, enable _Developer mode_ then _Load unpacked_ to select the [extension](extension) directory.

![Load extension](https://developer.chrome.com/static/images/get_started/load_extension.png)

See the [Getting Started Tutorial] for more information.

#### Host

Build the [application](host) and install the [native manifest][Native messaging host] to its [appropriate location][Native messaging host location]:

``` sh
cd host
make install
```

## Usage

More examples can be found [here][Create a keyboard interface to the web].

``` javascript
const port = chrome.runtime.connect('ohgecdnlcckpfnhjepfdcdgcfgebkdgl')
port.postMessage({ command: 'echo', arguments: ['Tchou'] })
port.onMessage.addListener((response) => {
  console.log(response.output)
})
```

See [Cross-extension messaging] for more details.

## API

### Request

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

### Response

``` crystal
{
  id: String?,
  status: Int32,
  output: String,
  error: String
}
```

[Chrome]: https://google.com/chrome/
[Create a keyboard interface to the web]: https://alexherbo2.github.io/blog/chrome/create-a-keyboard-interface-to-the-web/
[Getting Started Tutorial]: https://developer.chrome.com/extensions/getstarted
[Cross-extension messaging]: https://developer.chrome.com/extensions/messaging#external
[Native Messaging]: https://developer.chrome.com/extensions/nativeMessaging
[Native messaging host]: https://developer.chrome.com/extensions/nativeMessaging#native-messaging-host
[Native messaging host location]: https://developer.chrome.com/extensions/nativeMessaging#native-messaging-host-location
[Crystal]: https://crystal-lang.org
[jq]: https://stedolan.github.io/jq/
[Inkscape]: https://inkscape.org
