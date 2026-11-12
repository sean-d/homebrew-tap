class TheDeaner < Formula
  desc "Tmux-backed command center for running coding agents side by side"
  homepage "https://github.com/sean-d/the-deaner"
  url "https://github.com/sean-d/the-deaner/releases/download/v0.1.0/the-deaner-v0.1.0-aarch64-apple-darwin.tar.gz"
  version "0.1.0"
  sha256 "67bd4e791837962416ea4da00c143e38e275f311e6b91ed778c23cd50a528a5f"
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

      The frame keys (Alt-s, Alt-e, Alt-/) need Option to send Alt in your terminal.
      Ghostty: macos-option-as-alt = true. Optional: `brew install gh` for pull request
      and CI status in the sidebar.
    EOS
  end

  test do
    assert_match "the-deaner", shell_output("#{bin}/the-deaner --version")
  end
end
