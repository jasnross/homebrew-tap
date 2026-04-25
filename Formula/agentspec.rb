class Agentspec < Formula
  desc "Compile provider-neutral agent and skill specs"
  homepage "https://github.com/jasnross/agentspec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jasnross/agentspec/releases/download/v0.3.0/agentspec-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "93612e98561059ed23700b00bfb78ec4c54a4d63049090907888b79a6e20a796"
    else
      url "https://github.com/jasnross/agentspec/releases/download/v0.3.0/agentspec-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "da747d0acdf97ab05199c34fd344f5eef622dfdc859d4286074313799a4d8b4c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jasnross/agentspec/releases/download/v0.3.0/agentspec-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1a6e5a03ca3b8308af6f69bc9927e2669cbe1e881d3082f391b1c5742268d87f"
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
