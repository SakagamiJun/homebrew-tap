cask "panelneko" do
  version "0.7.1"
  
  on_arm do
    sha256 "a9160132428e5d716849ef61b2a1145f3cf8aa62987ab669538c3c0c86ed05bc"
    url "https://github.com/SakagamiJun/panelneko-reader/releases/download/v#{version}/panelneko-reader-macos-arm64.zip"
  end
  on_intel do
    sha256 "f3a6b960592f8abbc1204fdb731128500faec759ae1b86527d3e733a3f35738c"
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
