cask "panelneko" do
  version "0.11.0"

  on_arm do
    sha256 "00c10f2025106d628e1c9ef705296bc9b65182ed8aff0a5e8953ba3517e8d5d8"

    url "https://github.com/SakagamiJun/panelneko-reader/releases/download/v#{version}/panelneko-reader-macos-arm64.zip"
  end
  on_intel do
    sha256 "cf743869fa6e05ec01054c81e43edc7610d85abf4fe3a9e22478613ba7fda946"

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
