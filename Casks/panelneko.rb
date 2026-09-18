cask "panelneko" do
  version "0.8.0"

  on_arm do
    sha256 "07cc9f656cc0747b9aecc729ed40d76bef6c378898ca7a1f254c1aaadb8081ce"

    url "https://github.com/SakagamiJun/panelneko-reader/releases/download/v#{version}/panelneko-reader-macos-arm64.zip"
  end
  on_intel do
    sha256 "86131ffc92887add08ee0f882ccc4ff628b9fed5718d225b2b48d6f30e300603"

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
