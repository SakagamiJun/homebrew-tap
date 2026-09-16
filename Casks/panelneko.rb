cask "panelneko" do
  version "0.7.2"
  
  on_arm do
    sha256 "3ea01efee49cad93bd41540944a2d293b1b8f152e3ad7b84ddb657992a5cfd0b"
    url "https://github.com/SakagamiJun/panelneko-reader/releases/download/v#{version}/panelneko-reader-macos-arm64.zip"
  end
  on_intel do
    sha256 "8930f086872ed5bb4a3c6fb5f25c8ab5341ba6d71b53d733d4514c63c5498a39"
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
