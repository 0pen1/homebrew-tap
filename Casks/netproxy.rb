cask "netproxy" do
  version "3.7"
  sha256 "0b432a3e0341b9f7dc66c285451f00d6f01e1d145a6b8539a694c66ee86a623e"

  url "https://github.com/0pen1/clarity-proxy/releases/download/v#{version}/NetProxy-v#{version}.zip"
  name "clarity-proxy"
  desc "Per-process transparent proxy (NE system extension)"
  homepage "https://github.com/0pen1/clarity-proxy"

  depends_on macos: :monterey

  app "NetProxy.app"

  zap trash: "~/Library/Preferences/local.netproxy.3w73w8c23l.plist"

  # NE system extension: activation is a manual, one-time step (requires
  # admin approval in System Settings — cannot be automated by brew).
  caveats <<~EOS
    One-time activation (v3.8+): open NetProxy.app, click "激活系统扩展"
    in the onboarding banner, then approve in System Settings → Privacy
    & Security. CLI alternative:
    /Applications/NetProxy.app/Contents/MacOS/NetProxy activate

    Quit the menu-bar GUI before upgrading (overwriting a running app
    corrupts the code signature — CLI will then be killed by the kernel).
    If a previous (non-notarized) build was installed, uninstall it first
    (NetProxy uninstall) and reboot before installing this one.
  EOS
end
