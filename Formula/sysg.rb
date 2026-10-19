class Sysg < Formula
  desc "Agent-friendly general-purpose program orchestrator for busy people"
  homepage "https://sysg.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.68.6/sysg-0.68.6-aarch64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.68.6-aarch64-apple-darwin.tar.gz"
      sha256 "e36563dc962ec905c84bf81c03e96702f792ebb0de0e67e1b40600b159cc3ebb"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.68.6/sysg-0.68.6-x86_64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.68.6-x86_64-apple-darwin.tar.gz"
      sha256 "cad6d9f60fe536d822da37a768facee9eeed6ffeddcf4c79c26fe3f06a1c662e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.68.6/sysg-0.68.6-aarch64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.68.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "23a77466507644cb98669f2e0ec37fc6928e4b9f2fd597fbdc995edfabe58049"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.68.6/sysg-0.68.6-x86_64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.68.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e69cbd5adfb0184e1407232749f64cb50d721e3ddb043408ea0eb7758eebb0af"
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
