const shell = {}
shell.port = chrome.runtime.connectNative('shell')
chrome.runtime.onConnectExternal.addListener((port) => {
  // Send request to the application
  port.onMessage.addListener((request) => {
    shell.port.postMessage(request)
  })
  // Receive response
  shell.port.onMessage.addListener((response) => {
    port.postMessage(response)
  })
})
