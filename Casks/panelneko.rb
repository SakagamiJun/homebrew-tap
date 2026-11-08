cask "panelneko" do
  version "0.12.0"

  on_arm do
    sha256 "86fa6dc8edfbc0afb9a219282e3c1e99ab742def4cf7d6cc90e16873a4fa7945"

    url "https://github.com/SakagamiJun/panelneko-reader/releases/download/v#{version}/panelneko-reader-macos-arm64.zip"
  end
  on_intel do
    sha256 "828925e41197c5adb4ee08536877ebde007cf3721d76c822021fe9900f94d333"

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
