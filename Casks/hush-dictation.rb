cask "hush-dictation" do
  version "0.2.0-dev.5"
  sha256 "7316663dbd96117660efc34aaf8242bf342b514431ab3d8b1c5acbe9e131394d"

  url "https://github.com/ryan-stoffel/hush/releases/download/v#{version}/Hush-#{version}.zip"
  name "Hush"
  desc "Menu bar voice dictation that works in every app, on-device by default"
  homepage "https://github.com/ryan-stoffel/hush"

  depends_on macos: :sonoma

  app "Hush.app"

  uninstall quit: "io.github.ryan-stoffel.hush"

  zap trash: [
    "~/Library/Application Support/Hush",
    "~/Library/Preferences/io.github.ryan-stoffel.hush.plist",
    "~/Library/Saved Application State/io.github.ryan-stoffel.hush.savedState",
  ]

  caveats <<~EOS
    Hush is not notarized yet, so macOS blocks the first launch of a downloaded copy.

      After install: xattr -dr com.apple.quarantine /Applications/Hush.app
      Or:            open Hush once, then System Settings > Privacy & Security > Open Anyway.

    Homebrew 7 removed --no-quarantine, so repeat the xattr step after each upgrade.

    Hush asks for Microphone, Accessibility, and Input Monitoring on first use:
    the microphone to hear you, Accessibility to paste the text at your cursor,
    and Input Monitoring to notice the Fn key while another app is in front.
    Open Hush from the menu bar and use the Grant buttons in its popover.
  EOS
end
