cask "netproxy" do
  version "3.2"
  sha256 "f78f29fb2485b57222f040ae4f1d989ef2748827ff366a2306ec8b106d02fdef"

  url "https://github.com/0pen1/clarity-proxy/releases/download/v3.2/NetProxy-v3.2.zip"
  name "clarity-proxy"
  desc "Per-process transparent proxy for macOS (NE system extension)"
  homepage "https://github.com/0pen1/clarity-proxy"

  app "NetProxy.app"

  # NE system extension: activation is a manual, one-time step (requires
  # admin approval in System Settings — cannot be automated by brew).
  caveats <<~EOS
    One-time activation is required after install:

      /Applications/NetProxy.app/Contents/MacOS/NetProxy activate

    Then approve the extension in System Settings → Privacy & Security.
    If a previous (non-notarized) build was installed, uninstall it first
    (NetProxy uninstall) and reboot before installing this one.
  EOS

  uninstall delete: [
    "/Library/SystemExtensions/Library/SystemExtensions/db.plist",
  ]

  zap trash: [
    "~/Library/Preferences/local.netproxy.3w73w8c23l.plist",
  ]
end
