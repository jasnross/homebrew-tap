class Agentspec < Formula
  desc "Compile provider-neutral agent and skill specs"
  homepage "https://github.com/jasnross/agentspec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jasnross/agentspec/releases/download/v0.6.0/agentspec-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "cf55b1b48effe815a73137a4174347d946ed90d90dcf2861235f6e8a58a08f9a"
    else
      url "https://github.com/jasnross/agentspec/releases/download/v0.6.0/agentspec-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "ddb999356de70c4635551fb9bd99dcceee7d6a0127de75fe7c0e770bfe98c3ce"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jasnross/agentspec/releases/download/v0.6.0/agentspec-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d90e7a2293d160e1a8bc9acbedd8c9edad8eb8c79f6594f7880145b85e7596b7"
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
