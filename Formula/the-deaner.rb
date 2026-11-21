class TheDeaner < Formula
  desc "Tmux-backed command center for running coding agents side by side"
  homepage "https://github.com/sean-d/homebrew-tap"
  url "https://github.com/sean-d/homebrew-tap/releases/download/the-deaner-v0.2.6/the-deaner-v0.2.6-aarch64-apple-darwin.tar.gz"
  version "0.2.6"
  sha256 "af9c2b2c4dbc82d98a26ebe5764294a4e09be9c69823c655124fcd4a1fd3ccdf"
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
