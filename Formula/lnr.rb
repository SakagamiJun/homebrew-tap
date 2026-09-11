class Lnr < Formula
  desc "Modern, high-performance CLI & TUI light novel reader and downloader"
  homepage "https://github.com/SakagamiJun/lnovel_tui"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SakagamiJun/lnovel_tui/releases/download/v#{version}/lnr-v#{version}-darwin-arm64.tar.gz"
      sha256 "164781dc5eb8be46174f3bce9611018890be986e7eb149c7d6f1337ba6a3aec9"
    else
      url "https://github.com/SakagamiJun/lnovel_tui/releases/download/v#{version}/lnr-v#{version}-darwin-amd64.tar.gz"
      sha256 "c1ca7f3c6c2f8643f82672de82ede43a3164cde7c4616871f31a3b0414b16fa1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SakagamiJun/lnovel_tui/releases/download/v#{version}/lnr-v#{version}-linux-arm64.tar.gz"
      sha256 "e1f06e51ef44777c7ccee46d31d732c1027bfb663d5ce5ef7fedef62077a2e9e"
    else
      url "https://github.com/SakagamiJun/lnovel_tui/releases/download/v#{version}/lnr-v#{version}-linux-amd64.tar.gz"
      sha256 "bd97b01499396d5cf6f192369896e69c3efe1ec0917a6fa4c8e297abe936eaae"
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
