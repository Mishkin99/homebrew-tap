# typed: false
# frozen_string_literal: true

cask "lucid" do
  # TODO(release): bump on every Lucid release. Must match MARKETING_VERSION
  # in Lucid.xcodeproj exactly (release.sh enforces this on the producer side).
  version "1.0"
  # TODO(release): replace with `shasum -a 256 dist/Lucid-#{version}.dmg`
  # output before tagging the release. `:no_check` is a scaffold placeholder
  # ONLY — never ship a real release with it set.
  sha256 :no_check

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
