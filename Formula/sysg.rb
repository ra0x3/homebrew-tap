class Sysg < Formula
  desc "Agent-friendly general-purpose program orchestrator for busy people"
  homepage "https://sysg.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.68.7/sysg-0.68.7-aarch64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.68.7-aarch64-apple-darwin.tar.gz"
      sha256 "815b057629ea6912c6f90abec9e957472ebc32ac55650bfbc4f1b6504b0ee0d7"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.68.7/sysg-0.68.7-x86_64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.68.7-x86_64-apple-darwin.tar.gz"
      sha256 "d332ac2d6674ff0703476abfee51c97f58370a00110f7e61bdb90ca7216408f4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.68.7/sysg-0.68.7-aarch64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.68.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0543ac8a607f855de623e2897bc1bbde80f96d26d40563dc07a5ddb0fe2654bc"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.68.7/sysg-0.68.7-x86_64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.68.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2bac425721af0bd4a5128e0ecb8e90de18c026e80afddc59d8a3b26789ebe0dd"
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
