class TheDeaner < Formula
  desc "Tmux-backed command center for running coding agents side by side"
  homepage "https://github.com/sean-d/homebrew-tap"
  url "https://github.com/sean-d/homebrew-tap/releases/download/the-deaner-v0.2.5/the-deaner-v0.2.5-aarch64-apple-darwin.tar.gz"
  version "0.2.5"
  sha256 "36393e97e8b7a91a9ca2572526f4f69a70a9efc5856445fdaa010b7a62fca6d9"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "tmux"

  def install
    bin.install "the-deaner"
    doc.install "README.md"
  end

  def caveats
    <<~EOS
      Run `the-deaner` to start. The first time, it offers to add its Claude Code hooks.

      The frame keys (Alt-s, Alt-e, Alt-n, Alt-/) need Option to send Alt in your terminal.
      Ghostty: macos-option-as-alt = true. Optional: `brew install gh` for pull request
      and CI status in the sidebar.
    EOS
  end

  test do
    assert_match "the-deaner", shell_output("#{bin}/the-deaner --version")
  end
end
