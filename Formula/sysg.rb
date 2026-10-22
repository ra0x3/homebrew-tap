class Sysg < Formula
  desc "Agent-friendly general-purpose program orchestrator for busy people"
  homepage "https://sysg.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.69.1/sysg-0.69.1-aarch64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.69.1-aarch64-apple-darwin.tar.gz"
      sha256 "3fe1c0c5649570417a0e2c6bd01c9771322ed1cbf007daa3045ee572cec91bdf"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.69.1/sysg-0.69.1-x86_64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.69.1-x86_64-apple-darwin.tar.gz"
      sha256 "ab3c26d74e918daf8b4fbecaebd7e181d08e7bebb536976dadac563f0db6c043"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.69.1/sysg-0.69.1-aarch64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.69.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3c485803456cc148f435da2508d8b86a9317b8e0b9b016feff3fbf2080abe2ed"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.69.1/sysg-0.69.1-x86_64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.69.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "09ba065fc5e7dc3bbb9493b66fb5b03daf9dc2a50c95c941a4005f13b9527a19"
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
