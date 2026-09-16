cask "netproxy" do
  version "3.2"
  sha256 "f78f29fb2485b57222f040ae4f1d989ef2748827ff366a2306ec8b106d02fdef"

  url "https://github.com/0pen1/clarity-proxy/releases/download/v3.2/NetProxy-v3.2.zip"
  name "clarity-proxy"
  desc "Per-process transparent proxy for macOS (NE system extension)"
  homepage "https://github.com/0pen1/clarity-proxy"

  app "NetProxy.app"

  # Manual activation step is required after install (NE system extension):
  #   /Applications/NetProxy.app/Contents/MacOS/NetProxy activate
  # then approve in System Settings > Privacy & Security.
  post_install do
    puts <<~EOS
      ➜ Next step (one time): activate the system extension
          /Applications/NetProxy.app/Contents/MacOS/NetProxy activate
        then approve it in System Settings → Privacy & Security.
    EOS
  end

  uninstall delete: [
    "/Library/SystemExtensions/Library/SystemExtensions/db.plist",
  ]

  zap trash: [
    "~/Library/Preferences/local.netproxy.3w73w8c23l.plist",
  ]
end
