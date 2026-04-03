class Agentspec < Formula
  desc "Compile provider-neutral agent and skill specs"
  homepage "https://github.com/jasnross/agentspec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jasnross/agentspec/releases/download/v0.1.0/agentspec-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "ba67aba1e5258e558e2f5e4c438a905f38975cea2f6cc173e07a310bd4360889"
    else
      url "https://github.com/jasnross/agentspec/releases/download/v0.1.0/agentspec-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "6c2dd6991c262c2899fe1b786993f97ca00af8a9c8ca15020b8090ced4193be0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jasnross/agentspec/releases/download/v0.1.0/agentspec-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d3941d9d929b4c7ec6690231bf0e4abbd68ac340c2d0142085ece5e790ebc12b"
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
