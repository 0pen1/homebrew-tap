cask "netproxy" do
  version "3.6"
  sha256 "e1bbd2b9be6604661d589d415ae5819c0ed3fcfabe83aab6e78f7c744a13ff66"

  url "https://github.com/0pen1/clarity-proxy/releases/download/v#{version}/NetProxy-v#{version}.zip"
  name "clarity-proxy"
  desc "Per-process transparent proxy (NE system extension)"
  homepage "https://github.com/0pen1/clarity-proxy"

  depends_on macos: :monterey

  app "NetProxy.app"

  uninstall delete: "/Library/SystemExtensions/Library/SystemExtensions/db.plist"

  zap trash: "~/Library/Preferences/local.netproxy.3w73w8c23l.plist"

  # NE system extension: activation is a manual, one-time step (requires
  # admin approval in System Settings — cannot be automated by brew).
  caveats <<~EOS
    One-time activation is required after install:

      /Applications/NetProxy.app/Contents/MacOS/NetProxy activate

    Then approve the extension in System Settings → Privacy & Security.
    Quit the menu-bar GUI before upgrading (overwriting a running app
    corrupts the code signature — CLI will then be killed by the kernel).
    If a previous (non-notarized) build was installed, uninstall it first
    (NetProxy uninstall) and reboot before installing this one.
  EOS
end
