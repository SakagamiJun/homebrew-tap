cask "plistbar" do
  version "0.1.0"
  sha256 "d28dcc45f153714c0dc6b9e3a53229e59abda72aa817300adfed070c4b5a77df"

  url "https://github.com/SakagamiJun/PlistBar/releases/download/v#{version}/PlistBar.zip"
  name "PlistBar"
  desc "Lightweight launchd manager with memory safety"
  homepage "https://github.com/SakagamiJun/PlistBar"

  depends_on macos: ">= :sonoma"

  app "PlistBar.app"

  zap trash: [
    "~/Library/Application Support/com.sakagamijun.PlistBar",
    "~/Library/Preferences/com.sakagamijun.PlistBar.plist",
  ]
end
