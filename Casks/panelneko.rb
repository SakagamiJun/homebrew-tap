cask "panelneko" do
  version "0.2.0"
  
  on_arm do
    sha256 "6af3100a760781573881b81415fcc811d3a512962b46835d169eb2673f2eae21"
    url "https://github.com/SakagamiJun/panelneko-reader/releases/download/v#{version}/panelneko-reader-macos-arm64.zip"
  end
  on_intel do
    sha256 "2e056685e73a11e83fe3f9ffe17cc4ed3c75aa53103b06555b0702bdb07b074e"
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
