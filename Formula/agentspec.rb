class Agentspec < Formula
  # Replace sha256 values from the corresponding release SHA256SUMS.
  desc "Compile provider-neutral agent and skill specs"
  homepage "https://github.com/jasnross/agentspec"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jasnross/agentspec/releases/download/v#{version}/agentspec-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url "https://github.com/jasnross/agentspec/releases/download/v#{version}/agentspec-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "1111111111111111111111111111111111111111111111111111111111111111"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jasnross/agentspec/releases/download/v#{version}/agentspec-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2222222222222222222222222222222222222222222222222222222222222222"
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
