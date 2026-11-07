class Sysg < Formula
  desc "Agent-friendly general-purpose program orchestrator for busy people"
  homepage "https://sysg.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.70.3/sysg-0.70.3-aarch64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.70.3-aarch64-apple-darwin.tar.gz"
      sha256 "3ab852d7961a64f5d3c5d87d9f4c5e5c09c10048fdd410b09488c7685b7b7cb0"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.70.3/sysg-0.70.3-x86_64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.70.3-x86_64-apple-darwin.tar.gz"
      sha256 "920fa2289fe38c79bf36af8e929557cb0ad3a84ea3d742817070d067c57856a4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.70.3/sysg-0.70.3-aarch64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.70.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d99125f15bc7520eaa95b402620a1ca58a03b63d6b1941ee539394d35117caf1"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.70.3/sysg-0.70.3-x86_64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.70.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b01dfc4d9530f4f5f8118fdd20d5650cfe82d18ab577bbf6f2a11df19662f5cc"
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
