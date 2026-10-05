class Sysg < Formula
  desc "Agent-friendly general-purpose program orchestrator for busy people"
  homepage "https://sysg.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.68.2/sysg-0.68.2-aarch64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.68.2-aarch64-apple-darwin.tar.gz"
      sha256 "fb48a2dfba77dd004cdf84231c360a8c69b1e82fcd915a6bf2eb7aa5bd1f3796"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.68.2/sysg-0.68.2-x86_64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.68.2-x86_64-apple-darwin.tar.gz"
      sha256 "6b26ad040c3f880949dfa9dafbe2b276e88b9ed851e8d2143e2b7b46d52b13ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.68.2/sysg-0.68.2-aarch64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.68.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "700e812ffcb0c2f59256b5ab394528ea9bb83fafc73c2d35d27c1cd07833f0a8"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.68.2/sysg-0.68.2-x86_64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.68.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a63d5790c41bf643fd7856e507b5eb23ec76eedba6005b61f9447d1a83ea46ab"
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
