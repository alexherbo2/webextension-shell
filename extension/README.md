# Extension

## Dependencies

- [jq]
- [Zip]

[jq]: https://stedolan.github.io/jq/
[Zip]: http://infozip.sourceforge.net/Zip.html

## Installation

###### Chrome

``` sh
make chrome
```

Open the _Extensions_ page by navigating to `chrome://extensions`, enable _Developer mode_ then _Load unpacked_ to select the extension directory: `target/chrome`.

###### Firefox

``` sh
make firefox
```

- Open `about:config`, change `xpinstall.signatures.required` to `false`.
- Open `about:addons` ❯ _Extensions_, click _Install add-on from file_ and select the package file: `target/firefox/package.zip`.
