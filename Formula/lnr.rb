class Lnr < Formula
  desc "Modern, high-performance CLI & TUI light novel reader and downloader"
  homepage "https://github.com/SakagamiJun/lnovel_tui"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SakagamiJun/lnovel_tui/releases/download/v#{version}/lnr-v#{version}-darwin-arm64.tar.gz"
      sha256 "2951235cde535d4dbc8baab397b6dafe1c3f768b2c3c715b713e114bf119887b"
    else
      url "https://github.com/SakagamiJun/lnovel_tui/releases/download/v#{version}/lnr-v#{version}-darwin-amd64.tar.gz"
      sha256 "dcf34a26db2e41df6d239f07503c4f0a1d60a124f2cf04f7fcf22d209d5063d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SakagamiJun/lnovel_tui/releases/download/v#{version}/lnr-v#{version}-linux-arm64.tar.gz"
      sha256 "c93c67224ddf17d505735fe251a1f09064c4802b6012487f392020001b0a71ab"
    else
      url "https://github.com/SakagamiJun/lnovel_tui/releases/download/v#{version}/lnr-v#{version}-linux-amd64.tar.gz"
      sha256 "bb083525e5f14392caabe934aa1ebcf9c85e0acf4548390a527b11a99e0bdc54"
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
