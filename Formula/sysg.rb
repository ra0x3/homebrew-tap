class Sysg < Formula
  desc "Agent-friendly general-purpose program orchestrator for busy people"
  homepage "https://sysg.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.69.2/sysg-0.69.2-aarch64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.69.2-aarch64-apple-darwin.tar.gz"
      sha256 "3dc71797f64e4acbf20d926df5f2d268370ac204545300525972336d0abb1fd7"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.69.2/sysg-0.69.2-x86_64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.69.2-x86_64-apple-darwin.tar.gz"
      sha256 "993ccf9ab819c21b327d9b5fb6c8c464907b0878a69a4f28f0f6855856c8dd44"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.69.2/sysg-0.69.2-aarch64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.69.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "66fc2e2e337aa7464b3c08b32b68f570422d6544a2e0fcd8240411ca9f10c215"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.69.2/sysg-0.69.2-x86_64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.69.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "85387ad1a2decb903cc23e5927563a82dc6d1a3a19c466a9c87a7a797fbf0794"
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
