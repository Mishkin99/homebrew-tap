# typed: false
# frozen_string_literal: true

cask "lucid" do
  # TODO(release): bump on every Lucid release. Must match MARKETING_VERSION
  # in Lucid.xcodeproj exactly (release.sh enforces this on the producer side).
  version "1.0"
  sha256 "cb6344d1c8b8052c7869549b86c1762911eb728b86c28671ceac10805b4024c5"

  url "https://dl.lucidmac.app/releases/Lucid-#{version}.dmg"
  name "Lucid"
  desc "Menu bar utility that blocks input during keyboard or trackpad cleaning"
  homepage "https://lucidmac.app/"

  livecheck do
    url "https://dl.lucidmac.app/appcast.xml"
    strategy :sparkle
  end

  # Sparkle handles in-app updates. `auto_updates true` tells Homebrew not to
  # treat a Sparkle-upgraded build as outdated relative to the cask's version.
  auto_updates true
  depends_on macos: ">= :sonoma"

  app "Lucid.app"

  # Bundle identifier is `Mishkin.Lucid`. Keychain entries holding the license
  # key are intentionally NOT zapped — users who reinstall expect their license
  # to survive. Remove them manually via Keychain Access if a full wipe is
  # desired.
  zap trash: [
    "~/Library/Application Support/Mishkin.Lucid",
    "~/Library/Caches/Mishkin.Lucid",
    "~/Library/HTTPStorages/Mishkin.Lucid",
    "~/Library/Preferences/Mishkin.Lucid.plist",
    "~/Library/Saved Application State/Mishkin.Lucid.savedState",
  ]
end
