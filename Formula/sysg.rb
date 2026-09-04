class Sysg < Formula
  desc "Agent-friendly general-purpose program orchestrator for busy people"
  homepage "https://sysg.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.2/sysg-0.67.2-aarch64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.2-aarch64-apple-darwin.tar.gz"
      sha256 "3a0e93b4146a4a56d453d1b436176d2ffcdd867a22b3c4cddde95441bf11cbdc"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.2/sysg-0.67.2-x86_64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.2-x86_64-apple-darwin.tar.gz"
      sha256 "efc795c5693ecad5b377f4cedb50d39d008481c5f0696fc5b6a6df13d362b377"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.2/sysg-0.67.2-aarch64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8f83183949aabfb6f17d4d8b403cf4d8335057653f2c897048773d334181e8be"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.2/sysg-0.67.2-x86_64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7309237edd610816475e7c31d845058fc7ffc47d1edf4e710f5b69da3f11e81b"
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
