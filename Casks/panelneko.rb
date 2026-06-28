cask "panelneko" do
  version "0.3.1"
  
  on_arm do
    sha256 "71c1c0a03f913d72c5aa8b30de1335034086faf21b1ad6d78d3acc744c804c0a"
    url "https://github.com/SakagamiJun/panelneko-reader/releases/download/v#{version}/panelneko-reader-macos-arm64.zip"
  end
  on_intel do
    sha256 "13994b00337b0c266ec1975075c660180009d66b8e9652b23facba67788f86c9"
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
