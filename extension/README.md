# Extension

###### [Chrome](#chrome) | [Firefox](#firefox)

## Dependencies

- [Zip] (Zip is used to package the extension)
- [Inkscape] (Inkscape is used to convert SVG to PNG when uploading the extension)

## Installation

### Chrome

``` sh
make chrome
```

Open the _Extensions_ page by navigating to `chrome://extensions`, enable _Developer mode_ then _Load unpacked_ to select the extension directory: `target/chrome`.

![Load extension](https://developer.chrome.com/static/images/get_started/load_extension.png)

See the [Getting Started Tutorial] for more information.

### Firefox

``` sh
make firefox
```

- Open `about:config`, change `xpinstall.signatures.required` to `false`.
- Open `about:addons` ❯ _Extensions_, click _Install add-on from file_ and select the package file: `target/firefox/package.zip`.

#### Developing

Open `about:debugging` ❯ _This Firefox_ ❯ _Temporary extensions_, click _Load temporary add-on_ and select the manifest file: `target/firefox/manifest.json`.

[![Load extension](https://img.youtube.com/vi_webp/cer9EUKegG4/maxresdefault.webp)](https://youtu.be/cer9EUKegG4)

See [Firefox – Your first extension] for more information.

[Zip]: http://infozip.sourceforge.net/Zip.html
[Inkscape]: https://inkscape.org
[Getting Started Tutorial]: https://developer.chrome.com/extensions/getstarted
[Firefox – Your first extension]: https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/Your_first_WebExtension
