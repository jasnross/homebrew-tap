class Agentspec < Formula
  desc "Compile provider-neutral agent and skill specs"
  homepage "https://github.com/jasnross/agentspec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jasnross/agentspec/releases/download/v0.2.0/agentspec-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "c8913c5aadd33eb115fa693f82cab29e439acf5cb58902e03f0f3873900cd9db"
    else
      url "https://github.com/jasnross/agentspec/releases/download/v0.2.0/agentspec-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "464ff961d23f0573db94643a2bb4e71f37707a9661db019ee3b9a37f22fc5d5f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jasnross/agentspec/releases/download/v0.2.0/agentspec-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "610bf03c285bd513a7b773f0838a5c5313b777775fe51b668a134e74681049c0"
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
