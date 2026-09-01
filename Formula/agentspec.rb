class Agentspec < Formula
  desc "Compile provider-neutral agent and skill specs"
  homepage "https://github.com/jasnross/agentspec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jasnross/agentspec/releases/download/v0.5.0/agentspec-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "e48d23a112d749f8ec57c59c5e87a4d862d345e75b88d1e2940c7f5146cd2406"
    else
      url "https://github.com/jasnross/agentspec/releases/download/v0.5.0/agentspec-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "dca85eac05d7bdc173df0ce8943cb96299eced77ca9e1c5679d05af8066eebed"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jasnross/agentspec/releases/download/v0.5.0/agentspec-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bb8a5b4a03dc47a32090949f9d8eaba9356c0272133f55d5d17013329dd9dc47"
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
