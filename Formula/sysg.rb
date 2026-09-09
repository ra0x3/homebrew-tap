class Sysg < Formula
  desc "Agent-friendly general-purpose program orchestrator for busy people"
  homepage "https://sysg.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.4/sysg-0.67.4-aarch64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.4-aarch64-apple-darwin.tar.gz"
      sha256 "686c6b37cf1b9baca6cdabca35a66f74c8f4b94009488e85edd1a55decc9f732"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.4/sysg-0.67.4-x86_64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.4-x86_64-apple-darwin.tar.gz"
      sha256 "8b9ad29ee40d91e27f26800fffa03ea708f020c5146178f004795b9b184f3f6c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.4/sysg-0.67.4-aarch64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bee1a4562262f18dd85635c77d1ba7e2e6e09102805f4a6bf8ec1310d994d24c"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.4/sysg-0.67.4-x86_64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "337f5c8636ae7e1d3fa9c9387f60a08457e448c38b3d86f5fff8a429835c51c6"
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
