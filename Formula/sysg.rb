class Sysg < Formula
  desc "Agent-friendly general-purpose program orchestrator for busy people"
  homepage "https://sysg.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.66.9/sysg-0.66.9-aarch64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.66.9-aarch64-apple-darwin.tar.gz"
      sha256 "b77b029417c741509a5bbfec523adfad0bcb595f419487b332f47dec7d42c823"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.66.9/sysg-0.66.9-x86_64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.66.9-x86_64-apple-darwin.tar.gz"
      sha256 "a1d914caee52dc030d3a4b3b16320eec08db7ab3338a0fd2f57fd37c58669cc5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.66.9/sysg-0.66.9-aarch64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.66.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "18b5084d56dafb55aa729de249f57381f7baf47c8ebf599612ed0285ebcc1982"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.66.9/sysg-0.66.9-x86_64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.66.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "642b6086c743330f7ab173227282b97b30adae4f1c168b4f240a405316b48fa4"
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
