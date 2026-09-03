class Sysg < Formula
  desc "Agent-friendly general-purpose program orchestrator for busy people"
  homepage "https://sysg.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.0/sysg-0.67.0-aarch64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.0-aarch64-apple-darwin.tar.gz"
      sha256 "6fd963b0cb44f3b7ab24a14350d8c5613006d99049fe7cd409020d6c8a45b4c8"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.0/sysg-0.67.0-x86_64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.0-x86_64-apple-darwin.tar.gz"
      sha256 "fd7838481979acb6b92f5c67f1e76ae1c8a391cde76fbcb4aa4818abaef5a874"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.0/sysg-0.67.0-aarch64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fea15597f44e3ef3543d89097a5f63f8c8aeec4c620bdc7c51b7061d8056234a"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.0/sysg-0.67.0-x86_64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a73a089d79d27c12d60bf206be46aeef82ba72b8cd877811f4d1499a3053cba1"
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
