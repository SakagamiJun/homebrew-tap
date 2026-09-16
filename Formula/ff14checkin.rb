class Ff14checkin < Formula
  desc "FF14 盛大自动签到工具"
  homepage "https://github.com/SakagamiJun/ff14checkin"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SakagamiJun/ff14checkin/releases/download/v#{version}/ff14checkin-v#{version}-darwin-arm64.tar.gz"
      sha256 "611792efdffeecb620174039a9dfbbbc222bb8b171a413ed6b48771383485bf0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/SakagamiJun/ff14checkin/releases/download/v#{version}/ff14checkin-v#{version}-linux-amd64.tar.gz"
      sha256 "46b7a919b250d792b3a501d4de4ef37328c2135f116290bbb0afb70b15347da1"
    end
  end

  def install
    bin.install "ff14checkin"
  end

  test do
    assert_match "ff14checkin", shell_output("#{bin}/ff14checkin --version")
  end
end
