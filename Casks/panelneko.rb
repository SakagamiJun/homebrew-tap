cask "panelneko" do
  version "0.9.0"

  on_arm do
    sha256 "930a47e6e4d383b8feef62d8dedcdd78c73bd22905f41c1292dee2e12bfd382e"

    url "https://github.com/SakagamiJun/panelneko-reader/releases/download/v#{version}/panelneko-reader-macos-arm64.zip"
  end
  on_intel do
    sha256 "a1b654d781c953023d1ede5ae77027db23563a4946c96a90cc1b58d0504fa3f2"

    url "https://github.com/SakagamiJun/panelneko-reader/releases/download/v#{version}/panelneko-reader-macos-amd64.zip"
  end

  name "PanelNeko"
  desc "Beautiful and modern comic reader"
  homepage "https://github.com/SakagamiJun/panelneko-reader"

  depends_on :macos

  app "panelneko-reader.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/panelneko-reader.app"]
  end

  zap trash: [
    "~/Library/Application Support/panelneko-reader",
    "~/Library/Preferences/com.wails.panelneko-reader.plist",
    "~/Library/Saved Application State/com.wails.panelneko-reader.savedState",
  ]
end
