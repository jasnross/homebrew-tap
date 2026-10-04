class Agentspec < Formula
  desc "Compile provider-neutral agent and skill specs"
  homepage "https://github.com/jasnross/agentspec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jasnross/agentspec/releases/download/v0.7.0/agentspec-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "564ec4ff4853f3cdc0332d527c952897d5c091c9b87b14eedf03d84080cd3a8b"
    else
      url "https://github.com/jasnross/agentspec/releases/download/v0.7.0/agentspec-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "64ea46fb995e5580db61b6cbce4334d71dc924f6b995950df205ade0729427a0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jasnross/agentspec/releases/download/v0.7.0/agentspec-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c3260c711ceb96d9ce5d0db490f8e1e06ed9d52f9f3fdd05979230b7ce74b7e1"
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
