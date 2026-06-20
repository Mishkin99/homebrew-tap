# typed: false
# frozen_string_literal: true

cask "lucid" do
  # Bumped automatically on every release by the Lucid repo's CI
  # (scripts/update-homebrew-cask.sh). Must match MARKETING_VERSION in
  # Lucid.xcodeproj exactly (release.sh enforces this on the producer side).
  version "1.3.1"
  sha256 "2749cd72853b3583bb5aa15fd80b6610eb7acaaef2a038fae4621654fc347ede"

  url "https://dl.lucidmac.app/releases/Lucid-#{version}.dmg"
  name "Lucid"
  desc "Cleaning companion that fully locks input and lights up every smudge"
  homepage "https://lucidmac.app/"

  livecheck do
    url "https://dl.lucidmac.app/appcast.xml"
    strategy :sparkle
  end

  # Sparkle handles in-app updates. `auto_updates true` tells Homebrew not to
  # treat a Sparkle-upgraded build as outdated relative to the cask's version.
  auto_updates true
  depends_on macos: :sonoma

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
