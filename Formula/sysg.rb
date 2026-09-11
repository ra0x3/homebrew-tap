class Sysg < Formula
  desc "Agent-friendly general-purpose program orchestrator for busy people"
  homepage "https://sysg.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.7/sysg-0.67.7-aarch64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.7-aarch64-apple-darwin.tar.gz"
      sha256 "aa1143f8675a54758b09052abb5dcf2f42aa29fb90d1466499b99cee3e477e04"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.7/sysg-0.67.7-x86_64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.7-x86_64-apple-darwin.tar.gz"
      sha256 "7fe57289861df223083119c7ca299bff5565e3ed77678bf7f48eba8fc0336dd6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.7/sysg-0.67.7-aarch64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "50196e162cefc44e8e89668f45816ec1530182b4ddd83e62cb3db60513902aac"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.7/sysg-0.67.7-x86_64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c01ca8f3848ac6bb36b2a3e924fc96a861c4743883a9b23176afb4b88fc40935"
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
