cask "wisp" do
  arch arm: "arm64"

  version "0.1.0"
  sha256 "a24e5e1c7ca3e2f375c252e44f876ef948298f6b6166c9f9648876d7d2e39782"

  url "https://github.com/ryan-stoffel/wisp/releases/download/v#{version}/wisp-#{version}-#{arch}.zip"
  name "Wisp"
  desc "Editor with a coordinator chat that runs AI agents on machines you own"
  homepage "https://github.com/ryan-stoffel/wisp"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Wisp.app"
  binary "#{appdir}/Wisp.app/Contents/Resources/app/bin/wisp"
  binary "#{appdir}/Wisp.app/Contents/Resources/app/bin/wispd"

  uninstall launchctl: "io.github.ryan-stoffel.wisp.wispd"

  zap trash: [
    "~/.wisp",
    "~/.wisp-shared",
    # The editor's Wisp and wispd's wisp: one folder, unless the volume is case-sensitive
    "~/Library/Application Support/[Ww]isp",
    "~/Library/Caches/io.github.ryan-stoffel.wisp",
    "~/Library/HTTPStorages/io.github.ryan-stoffel.wisp",
    "~/Library/LaunchAgents/io.github.ryan-stoffel.wisp.wispd.plist",
    "~/Library/Preferences/io.github.ryan-stoffel.wisp.plist",
    "~/Library/Saved Application State/io.github.ryan-stoffel.wisp.savedState",
  ]

  caveats <<~EOS
    Wisp is not signed with an Apple Developer ID yet, so macOS blocks its first launch.
    Try to open it, close the warning, then click Open Anyway in
    System Settings > Privacy & Security. Or remove the quarantine attribute:
      xattr -dr com.apple.quarantine #{appdir}/Wisp.app
    macOS asks again after each upgrade. Details:
      https://github.com/ryan-stoffel/wisp#install
  EOS
end
