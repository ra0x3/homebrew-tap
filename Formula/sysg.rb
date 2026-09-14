class Sysg < Formula
  desc "Agent-friendly general-purpose program orchestrator for busy people"
  homepage "https://sysg.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.8/sysg-0.67.8-aarch64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.8-aarch64-apple-darwin.tar.gz"
      sha256 "eceb3f9fe198eb81dcf084f76c1d9d7bb3d3d8725141d4137b3f72a07a2eca3d"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.8/sysg-0.67.8-x86_64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.8-x86_64-apple-darwin.tar.gz"
      sha256 "328a534f19c470f7b375750dece44473300cc40e6fd5c6e9f862810a869c97a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.8/sysg-0.67.8-aarch64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "58e6841470b94ee8a7f474f06c2a2352f6da61f0f89d8c3afedcd75b4dfdb9e6"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.8/sysg-0.67.8-x86_64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4afc889e93dc6dbff0c5daf7518e875b9fafe16497a5d9bd10ca5a64ba743957"
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
