cask "photon" do
  version "0.3.9"
  sha256 "7c26e61f51058e323f4e1dc427d0c583fdaec930e8b8b3df765659372b9eeb99"

  url "https://github.com/RyanStoffel/photon/releases/download/v#{version}/Photon-#{version}.zip"
  name "Photon"
  desc "Fast, minimal launcher for apps, clipboard history, notes, and files"
  homepage "https://github.com/RyanStoffel/photon"

  depends_on macos: :sonoma

  app "Photon.app"

  zap trash: [
    "~/Library/Application Support/Photon",
    "~/Library/Caches/com.ryanstoffel.photon",
    "~/Library/Preferences/com.ryanstoffel.photon.plist",
    "~/Library/Saved Application State/com.ryanstoffel.photon.savedState",
  ]

  caveats <<~EOS
    Photon is ad-hoc signed and not notarized yet, so macOS blocks the first
    launch of a downloaded copy.

      macOS 14:  Control-click Photon.app in /Applications and choose Open.
      macOS 15+: open Photon once, then System Settings > Privacy & Security > Open Anyway.
      Or:        xattr -dr com.apple.quarantine /Applications/Photon.app

    Photon asks for Accessibility access on first launch. It is needed to paste
    clipboard items into other apps, for the Hyper key, and for window
    management. Everything else works without it.
  EOS
end
