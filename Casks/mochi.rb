cask "mochi" do
  version "1.3"
  sha256 "e7a35ae057c5b39a5fb758008da6ba89bd65215c07cf49d26e7472d5a6454676"

  url "https://github.com/ryan-stoffel/mochi/releases/download/v#{version}/Mochi-#{version}.zip"
  name "Mochi"
  desc "Pixel desktop pet that keeps you company and acts out what Claude Code is doing"
  homepage "https://github.com/ryan-stoffel/mochi"

  depends_on macos: :ventura

  app "Mochi.app"

  uninstall quit: "com.joey.mochi"

  zap trash: [
    "~/Library/Application Support/Mochi",
    "~/Library/Preferences/com.joey.mochi.plist",
  ]

  caveats <<~EOS
    Mochi is ad-hoc signed and not notarized, so macOS blocks the first launch
    of a downloaded copy.

      After install: xattr -dr com.apple.quarantine /Applications/Mochi.app
      Or:            open Mochi once, then System Settings > Privacy & Security > Open Anyway.

    Homebrew 7 removed --no-quarantine, so repeat the xattr step after each upgrade.

    Always use the fully qualified name, including for upgrades:
      brew upgrade --cask ryan-stoffel/taps/mochi
    A bare "mochi" resolves to an unrelated flashcard app in homebrew-cask.

    If you connected Claude Code, use Disconnect Claude Code in Mochi's settings
    before a zap: it removes Mochi's hooks from ~/.claude/settings.json.
  EOS
end
