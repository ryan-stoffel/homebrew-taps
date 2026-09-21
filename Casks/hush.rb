cask "hush" do
  version "0.2.0-dev.2"
  sha256 "cdecb4bb8a3f17b66c51a6febb08234d03e4371519050d5bf3d5ea3bd1266f57"

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

      Install with:  brew install --cask --no-quarantine ryan-stoffel/taps/hush
      Or afterwards: xattr -dr com.apple.quarantine /Applications/Hush.app
      Or:            open Hush once, then System Settings > Privacy & Security > Open Anyway.

    Hush asks for Microphone, Accessibility, and Input Monitoring on first use:
    the microphone to hear you, Accessibility to paste the text at your cursor,
    and Input Monitoring to notice the Fn key while another app is in front.
    Open Hush from the menu bar and use the Grant buttons in its popover.
  EOS
end
