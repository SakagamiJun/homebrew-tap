class Lnr < Formula
  desc "Modern, high-performance CLI & TUI light novel reader and downloader"
  homepage "https://github.com/SakagamiJun/lnovel_tui"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SakagamiJun/lnovel_tui/releases/download/v#{version}/lnr-v#{version}-darwin-arm64.tar.gz"
      sha256 "8cb6c8d034c8487869dcaac2f51ccea74e342e51c632e31b94fca5bc7e5c497e"
    else
      url "https://github.com/SakagamiJun/lnovel_tui/releases/download/v#{version}/lnr-v#{version}-darwin-amd64.tar.gz"
      sha256 "6e3f909854f9c11f2ac68df84c305742951e541690ea2752a74c235db75f2b18"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SakagamiJun/lnovel_tui/releases/download/v#{version}/lnr-v#{version}-linux-arm64.tar.gz"
      sha256 "10c00e8afdfe8373ee68eef41ca2c396fe73385efb069ecd44527454bebd92ac"
    else
      url "https://github.com/SakagamiJun/lnovel_tui/releases/download/v#{version}/lnr-v#{version}-linux-amd64.tar.gz"
      sha256 "ce444f94fa63c98b0b09d217708ce3631c13fab89625c95e91ef446089ae14bc"
    end
  end

  def install
    bin.install "lnr"
    bin.install "lnr-tui"
    bin.install_symlink "lnr-tui" => "lnovel-tui"

    generate_completions_from_executable(bin/"lnr", "completion")
  end

  test do
    assert_match "LightNovelReader CLI", shell_output("#{bin}/lnr --help")
    assert_match "LightNovelReader CLI", shell_output("#{bin}/lnr version")
  end
end
