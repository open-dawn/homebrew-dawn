cask "dawn" do
  version "1.2.0"
  sha256 "7ce5b6ce89bdf8f13f25f86da5f9275c3f17188e94387664dd5e8b1d78c8b860"

  url "https://github.com/open-dawn/dawn/releases/download/v#{version}/DAWN-#{version}.dmg"
  name "DAWN"
  desc "Workspace manager for app and window contexts"
  homepage "https://opendawn.app/"

  livecheck do
    url "https://update.opendawn.app/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "DAWN.app"

  uninstall quit: [
    "app.opendawn.dawnAgent",
    "app.opendawn.dawnApp",
  ]

  zap trash: [
    "~/Library/Application Support/app.opendawn.dawnApp",
    "~/Library/Caches/app.opendawn.dawnApp",
    "~/Library/HTTPStorages/app.opendawn.dawnAgent",
    "~/Library/HTTPStorages/app.opendawn.dawnApp",
    "~/Library/Preferences/app.opendawn.dawnAgent.plist",
    "~/Library/Preferences/app.opendawn.dawnApp.plist",
    "~/Library/Saved Application State/app.opendawn.dawnApp.savedState",
  ]
end
