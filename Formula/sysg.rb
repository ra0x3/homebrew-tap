class Sysg < Formula
  desc "Agent-friendly general-purpose program orchestrator for busy people"
  homepage "https://sysg.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.66.4/sysg-0.66.4-aarch64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.66.4-aarch64-apple-darwin.tar.gz"
      sha256 "80900a2cc4b3b93496b03f73919e164335d4a460da9ecc36a7804cf6256c60c6"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.66.4/sysg-0.66.4-x86_64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.66.4-x86_64-apple-darwin.tar.gz"
      sha256 "7dd4d15c02b5b7797f6c80994ea8a99e146b52c5dae9354af3bab52582eafa55"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.66.4/sysg-0.66.4-aarch64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.66.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1729230d03db2ed614d4f9c1eb6b3372f6aea765710a995e374c422836912889"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.66.4/sysg-0.66.4-x86_64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.66.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2da1dc6a2994bfc1860c3760eb69de15f7f0966ccfe1364f4361f67178751597"
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
