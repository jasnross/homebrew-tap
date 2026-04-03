class Agentspec < Formula
  desc "Compile provider-neutral agent and skill specs"
  homepage "https://github.com/jasnross/agentspec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jasnross/agentspec/releases/download/v0.1.0/agentspec-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "7853b3b00b4488ca6555145d810b770e66be87284d4ac5f1f413a80c68294383"
    else
      url "https://github.com/jasnross/agentspec/releases/download/v0.1.0/agentspec-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "5d84e3d8594454bf10b940837dd3989a25938fae06d284288c20bb8ea02e5ffe"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jasnross/agentspec/releases/download/v0.1.0/agentspec-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "552cc5e39a309dfdf287ef7dc9cdb3c73b4f0546eb4364d181ad0972c6bd8f7f"
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
