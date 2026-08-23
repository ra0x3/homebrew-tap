class Sysg < Formula
  desc "Agent-friendly general-purpose program orchestrator for busy people"
  homepage "https://sysg.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.66.6/sysg-0.66.6-aarch64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.66.6-aarch64-apple-darwin.tar.gz"
      sha256 "ced9bf34ff96e2bfbc7c204eb5db3340ff88df913ca8d4450a64084483a0409d"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.66.6/sysg-0.66.6-x86_64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.66.6-x86_64-apple-darwin.tar.gz"
      sha256 "1eaa2154213411e01df28efadcdf134c43072be472e387c1aef8e63b5fb3365b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.66.6/sysg-0.66.6-aarch64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.66.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "58dd153ca9fab31e83cde8f0e1f86ae0624e316ced99ca4df55f32b2ad6c6efd"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.66.6/sysg-0.66.6-x86_64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.66.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "76703fc1aaa6bbd52d171eb392fc7423abf41b9afdd156edb78489f7b02f9619"
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
