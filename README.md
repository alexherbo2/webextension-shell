# Shell for [Chrome]

###### [Chrome](#chrome) | [Firefox](#firefox)

> Chrome API to execute external commands through [native messaging].

## Dependencies

- [Crystal]
- [Docker] (for static builds)
- [jq]
- [Zip] (Zip is used to package the extension)
- [Inkscape] (Inkscape is used to convert SVG to PNG when uploading the extension)

## Installation

### Chrome

#### Installing from the Chrome Web Store

https://chrome.google.com/webstore/detail/shell/ohgecdnlcckpfnhjepfdcdgcfgebkdgl

#### Installing from the source

##### Extension

``` sh
cd extension
make chrome
```

Open the _Extensions_ page by navigating to `chrome://extensions`, enable _Developer mode_ then _Load unpacked_ to select the extension directory: `extension/target/chrome`.

![Load extension](https://developer.chrome.com/static/images/get_started/load_extension.png)

See the [Getting Started Tutorial] for more information.

##### Host

Build the [application](host) and install the [native manifest][Native messaging host] to its [appropriate location][Native messaging host location]:

``` sh
cd host
make chrome
make chromium
```

### Firefox

#### Extension

``` sh
cd extension
make firefox
```

- Open `about:config`, change `xpinstall.signatures.required` to `false`.
- Open `about:addons` ❯ _Extensions_, click _Install add-on from file_ and select the package file: `extension/target/firefox/package.zip`.

##### Developing

Open `about:debugging` ❯ _This Firefox_ ❯ _Temporary extensions_, click _Load temporary add-on_ and select the manifest file: `extension/target/firefox/manifest.json`.

[![Load extension](https://img.youtube.com/vi_webp/cer9EUKegG4/maxresdefault.webp)](https://youtu.be/cer9EUKegG4)

See [Firefox – Your first extension] for more information.

#### Host

Build the [application](host) and install the [native manifest][Firefox – Native manifests] to its [appropriate location][Firefox – Native manifest location]:

``` sh
cd host
make firefox
```

## Usage

More examples can be found at [Krabby].

``` javascript
const port = chrome.runtime.connect('ohgecdnlcckpfnhjepfdcdgcfgebkdgl') // for a Chrome extension
const port = chrome.runtime.connect('shell@alexherbo2.github.com') // for a Firefox extension
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

## References

- [Create a keyboard interface to the web]

[Chrome]: https://google.com/chrome/
[Chrome Web Store]: https://chrome.google.com/webstore

[Firefox]: https://mozilla.org/firefox/
[Firefox Add-ons]: https://addons.mozilla.org

[Crystal]: https://crystal-lang.org
[Docker]: https://docker.com
[jq]: https://stedolan.github.io/jq/
[Zip]: http://infozip.sourceforge.net/Zip.html
[Inkscape]: https://inkscape.org

[Getting Started Tutorial]: https://developer.chrome.com/extensions/getstarted
[Cross-extension messaging]: https://developer.chrome.com/extensions/messaging#external
[Native Messaging]: https://developer.chrome.com/extensions/nativeMessaging
[Native messaging host]: https://developer.chrome.com/extensions/nativeMessaging#native-messaging-host
[Native messaging host location]: https://developer.chrome.com/extensions/nativeMessaging#native-messaging-host-location

[Firefox – Your first extension]: https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/Your_first_WebExtension
[Firefox – Native manifests]: https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/Native_manifests
[Firefox – Native manifest location]: https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/Native_manifests#Manifest_location

[Krabby]: https://krabby.netlify.com
[Create a keyboard interface to the web]: https://alexherbo2.github.io/blog/chrome/create-a-keyboard-interface-to-the-web/
