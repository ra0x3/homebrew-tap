class Sysg < Formula
  desc "Agent-friendly general-purpose program orchestrator for busy people"
  homepage "https://sysg.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.13/sysg-0.67.13-aarch64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.13-aarch64-apple-darwin.tar.gz"
      sha256 "f3530384524ad01fd25345f2971e22d1b6fb00cb29c32f9b81edc549c1dcec43"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.13/sysg-0.67.13-x86_64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.13-x86_64-apple-darwin.tar.gz"
      sha256 "e4c88924fc88c394ac8a27a725a7e107fddb9294e4ab440eb3319e09d0257644"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.13/sysg-0.67.13-aarch64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "13b730f228608825bd3226622a43bd15e30a3f40212f4688320712d3c0f4995c"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.13/sysg-0.67.13-x86_64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6c5db0630bec04bed519e147dc75690b3b83cc16e4deb10efd116929936f92fb"
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
