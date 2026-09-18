class Sysg < Formula
  desc "Agent-friendly general-purpose program orchestrator for busy people"
  homepage "https://sysg.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.10/sysg-0.67.10-aarch64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.10-aarch64-apple-darwin.tar.gz"
      sha256 "1e825d62f742ece52b285e77071edecb964cb5c9fe79be0305fe8e97344adc97"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.10/sysg-0.67.10-x86_64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.10-x86_64-apple-darwin.tar.gz"
      sha256 "5922a37f053df60c18b77dde68401bfbd637688d931ad3626c2b2c50eb1f3619"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.10/sysg-0.67.10-aarch64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0acc83c949981b0f712f2357682156f1d2535c5cd4786486150d735d7fc633dc"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.10/sysg-0.67.10-x86_64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2cb4c2b3807b635dedc0d46798ed2ba519c2b8ef914abf6f6ed6387497d092b4"
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
