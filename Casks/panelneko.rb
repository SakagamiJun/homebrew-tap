cask "panelneko" do
  version "0.6.0"
  
  on_arm do
    sha256 "4a306d7cafdc39ada1b2f891f961675d0f44a0b6589b7d5a64dd035fa5e982af"
    url "https://github.com/SakagamiJun/panelneko-reader/releases/download/v#{version}/panelneko-reader-macos-arm64.zip"
  end
  on_intel do
    sha256 "61007e402f395823a3baee2b2f7d36eabd43d36f4b7caabf59721da583e6070e"
    url "https://github.com/SakagamiJun/panelneko-reader/releases/download/v#{version}/panelneko-reader-macos-amd64.zip"
  end

  name "PanelNeko"
  desc "A beautiful and modern comic reader"
  homepage "https://github.com/SakagamiJun/panelneko-reader"

  app "panelneko-reader.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/panelneko-reader.app"], sudo: false
  end
  zap trash: [
    "~/Library/Application Support/panelneko-reader",
    "~/Library/Preferences/com.wails.panelneko-reader.plist",
    "~/Library/Saved Application State/com.wails.panelneko-reader.savedState",
  ]
end
