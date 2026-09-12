class Lnr < Formula
  desc "Modern, high-performance CLI & TUI light novel reader and downloader"
  homepage "https://github.com/SakagamiJun/lightnovel-tui"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SakagamiJun/lightnovel-tui/releases/download/v#{version}/lnr-v#{version}-darwin-arm64.tar.gz"
      sha256 "3ae2aaff54522034b340f51a362541e419f10189b0c5fda575d26e6f937833e7"
    else
      url "https://github.com/SakagamiJun/lightnovel-tui/releases/download/v#{version}/lnr-v#{version}-darwin-amd64.tar.gz"
      sha256 "4570e87b9621d4a764d1db651c0c731fb30aad933d54c0127504d4180bd3c108"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SakagamiJun/lightnovel-tui/releases/download/v#{version}/lnr-v#{version}-linux-arm64.tar.gz"
      sha256 "22e2053a0a88f848a1c53dd87324313fbc05821d3fbcfef6b69446c674124c70"
    else
      url "https://github.com/SakagamiJun/lightnovel-tui/releases/download/v#{version}/lnr-v#{version}-linux-amd64.tar.gz"
      sha256 "782ae828c61fe9963bb0815ca947e5e6b2038a602d7e92209d4f52e25cdac885"
    end
  end

  def install
    bin.install "lnr"
    bin.install "lnr-tui"
    bin.install_symlink "lnr-tui" => "lightnovel-tui"

    generate_completions_from_executable(bin/"lnr", "completion")
  end

  test do
    assert_match "LightNovelReader CLI", shell_output("#{bin}/lnr --help")
    assert_match "LightNovelReader CLI", shell_output("#{bin}/lnr version")
  end
end
