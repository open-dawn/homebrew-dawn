cask "dawn" do
  version "1.0.0"
  sha256 "176f2b8325d6b63e8536eb846c89b461ab398aff998db1260a8f974f607841a4"

  url "https://github.com/open-dawn/dawn/releases/download/v#{version}/DAWN-#{version}.dmg",
      verified: "github.com/open-dawn/dawn/"
  name "DAWN"
  desc "macOS workspace manager for app and window contexts"
  homepage "https://opendawn.app/"

  livecheck do
    url "https://update.opendawn.app/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :tahoe
  depends_on arch: :arm64

  app "DAWN.app"

  uninstall quit: [
    "app.opendawn.dawnApp",
    "app.opendawn.dawnAgent",
  ]

  zap trash: [
    "~/Library/Application Support/app.opendawn.dawnApp",
    "~/Library/Caches/app.opendawn.dawnApp",
    "~/Library/HTTPStorages/app.opendawn.dawnApp",
    "~/Library/HTTPStorages/app.opendawn.dawnAgent",
    "~/Library/Preferences/app.opendawn.dawnApp.plist",
    "~/Library/Preferences/app.opendawn.dawnAgent.plist",
    "~/Library/Saved Application State/app.opendawn.dawnApp.savedState",
  ]
end
