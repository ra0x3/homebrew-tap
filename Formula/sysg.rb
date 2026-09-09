class Sysg < Formula
  desc "Agent-friendly general-purpose program orchestrator for busy people"
  homepage "https://sysg.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.3/sysg-0.67.3-aarch64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.3-aarch64-apple-darwin.tar.gz"
      sha256 "158df6af52784fc2948afa3e4ee9ec82077a00dfd209a68a87c9f34760dc0da5"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.3/sysg-0.67.3-x86_64-apple-darwin.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.3-x86_64-apple-darwin.tar.gz"
      sha256 "5848544f0d7e70ffe128ea4e01c383d84c8fd17147db59585c1478a43117d0d3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.3/sysg-0.67.3-aarch64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "002d55a17dbcd21e02d63a1bf99af3331487a4c2b09780c2f9aaa29243caf691"
    end

    on_intel do
      url "https://github.com/ra0x3/systemg/releases/download/v0.67.3/sysg-0.67.3-x86_64-unknown-linux-gnu.tar.gz"
      mirror "https://sh.sysg.dev/sysg-0.67.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "54b82bfbb27faeba2d3e9fc331f2445162089ece561ebdffefb5201daccd5236"
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
