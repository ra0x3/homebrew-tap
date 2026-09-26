class Sysg < Formula
  desc "Agent-friendly general-purpose program orchestrator for busy people"
  homepage "https://sysg.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.11/sysg-0.67.11-aarch64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.11-aarch64-apple-darwin.tar.gz"
      sha256 "849ecb0827eae306ea498ccf9213aa94eeba930b5e5d15360f1515d3981d37cc"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.11/sysg-0.67.11-x86_64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.11-x86_64-apple-darwin.tar.gz"
      sha256 "8e253a61c8171c60adeddab5e240cee9a810aa83d7ebb24f741560329a115551"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.11/sysg-0.67.11-aarch64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c845faf2c74458fe9699d79e56659e69ba9126af0348ef11fe32532340ba57f9"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.11/sysg-0.67.11-x86_64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1426c25a1c02453a8ef23315a47fcb311493b8e3adc38509f45430afa4cda870"
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
