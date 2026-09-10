class Sysg < Formula
  desc "Agent-friendly general-purpose program orchestrator for busy people"
  homepage "https://sysg.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.5/sysg-0.67.5-aarch64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.5-aarch64-apple-darwin.tar.gz"
      sha256 "fb56f2e6460b6af4c1cb915eb6c63b5ec8fcd802db5d3955b535335957a18941"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.5/sysg-0.67.5-x86_64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.5-x86_64-apple-darwin.tar.gz"
      sha256 "c0f62a037ebffb08d0a460a3a67726ad3a708e1979d5c674a24e977cf80414ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.5/sysg-0.67.5-aarch64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "41a2f9f3343024913226704ecc70fb9279abff63084901933605d2c1554e3b40"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.5/sysg-0.67.5-x86_64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "29035eb1675b65b79e54ab9c179c3990b84e593593f8782e43dcb29b8e6c0b4a"
    end
  end

  def install
    bin.install "sysg"
  end

  def caveats
    <<~EOS
      Homebrew replaces the binary on disk, but a supervisor that is already
      resident keeps serving the build it booted from. Compare the two with:

        sysg version

      To adopt this build, stop the resident supervisor and start your projects
      again. This stops every registered project:

        sysg stop --supervisor
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sysg --version")
  end
end
