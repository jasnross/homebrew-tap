class Agentspec < Formula
  desc "Compile provider-neutral agent and skill specs"
  homepage "https://github.com/jasnross/agentspec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jasnross/agentspec/releases/download/v0.4.0/agentspec-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "77d7ae54e428b209f5561e4df87880d8fffb9088202910cdb4dbee6f1ce1c379"
    else
      url "https://github.com/jasnross/agentspec/releases/download/v0.4.0/agentspec-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "2c2e38796052073ccac78471855927af7ecd5e78741ab17c2669356604e98fb5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jasnross/agentspec/releases/download/v0.4.0/agentspec-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c1ae83f775d50c81354c9c623449b7623902632567492f8065574a0a7ad5af3b"
    else
      odie "agentspec binaries are currently published only for x86_64 Linux"
    end
  end

  def install
    bin.install "agentspec"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentspec --version")
  end
end
