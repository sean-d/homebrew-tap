class TheDeaner < Formula
  desc "Tmux-backed command center for running coding agents side by side"
  homepage "https://github.com/sean-d/the-deaner"
  url "https://github.com/sean-d/the-deaner/releases/download/v0.1.9/the-deaner-v0.1.9-aarch64-apple-darwin.tar.gz"
  version "0.1.9"
  sha256 "d913f5aec88fcc20552a0c7d09b62c60e0c7a3c8d0cdbeebdc24ea4bfc481b5c"
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
