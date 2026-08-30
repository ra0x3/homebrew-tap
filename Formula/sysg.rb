class Sysg < Formula
  desc "Agent-friendly general-purpose program orchestrator for busy people"
  homepage "https://sysg.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.66.7/sysg-0.66.7-aarch64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.66.7-aarch64-apple-darwin.tar.gz"
      sha256 "b1aa2e67d733a8edf95fb9efacbf10b18a03bda82eea0589f2e7f8a50bf45911"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.66.7/sysg-0.66.7-x86_64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.66.7-x86_64-apple-darwin.tar.gz"
      sha256 "210e24f0f12add3699cf08358235286aea2fe5ba4a269c05241ff8204a7358f8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.66.7/sysg-0.66.7-aarch64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.66.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "526c47ad875fe7468c6b80354d5fa41d9a87981997f15e4c017b554b0c5b9da8"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.66.7/sysg-0.66.7-x86_64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.66.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "83427c0bb7d98e76282bae00aa79d39f67871523bd252e189d3e00b483ad7036"
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
