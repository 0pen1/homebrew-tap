cask "netproxy" do
  version "3.6.1"
  sha256 "bfa1f32e589e54bc6dd32ce826ae87cbcad755af1d2880c687b21146c305e2a4"

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
