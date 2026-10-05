class Sysg < Formula
  desc "Agent-friendly general-purpose program orchestrator for busy people"
  homepage "https://sysg.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.68.1/sysg-0.68.1-aarch64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.68.1-aarch64-apple-darwin.tar.gz"
      sha256 "601d2584bc38fcde1101ba29b7ca314b8d56d25a550c3279fc2236a52ece9ad4"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.68.1/sysg-0.68.1-x86_64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.68.1-x86_64-apple-darwin.tar.gz"
      sha256 "2c436e03b52e1b8add9131661d57fcd08b2d586f50068c479e957f80888047b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.68.1/sysg-0.68.1-aarch64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.68.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1d849d9ade2ec36d363a594d03fa27749bdfd4f97a1aa32aaf2dbc231e727f62"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.68.1/sysg-0.68.1-x86_64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.68.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "943172d0b2e3e3ffe2432248d9ffde12f5d969a3e9552f08a928b9626f8f8d19"
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
