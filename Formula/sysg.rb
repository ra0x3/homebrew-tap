class Sysg < Formula
  desc "Agent-friendly general-purpose program orchestrator for busy people"
  homepage "https://sysg.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.1/sysg-0.67.1-aarch64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.1-aarch64-apple-darwin.tar.gz"
      sha256 "14ad4ede9b7c853658e50606c7c0b3904e8f26b81917d255efcbc9a26da416c5"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.1/sysg-0.67.1-x86_64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.1-x86_64-apple-darwin.tar.gz"
      sha256 "2be70b6faa7bc3e187bc3bfa9e81fa932c6527b7a678d4945039c92229209468"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.1/sysg-0.67.1-aarch64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "91ad5760be17ca04f9ff69db38f029832c95a27ca73d1b4e41492bfc425fc9fe"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.1/sysg-0.67.1-x86_64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dd02eb57e0b0fe8dc6445d3d5195597f2891e43601c079fe3a65d25665d54854"
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
