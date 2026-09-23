cask "panelneko" do
  version "0.10.0"

  on_arm do
    sha256 "de85f9bda5c8f4b232c42266fbf6b57fab5414af0a37c83f779ed6b356217b31"

    url "https://github.com/SakagamiJun/panelneko-reader/releases/download/v#{version}/panelneko-reader-macos-arm64.zip"
  end
  on_intel do
    sha256 "f3add57cd2232b6000625a53f96f649bbf80039ddd79c4217f7d11851ca5d9a1"

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
