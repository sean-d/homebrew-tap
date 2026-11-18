class TheDeaner < Formula
  desc "Tmux-backed command center for running coding agents side by side"
  homepage "https://github.com/sean-d/the-deaner"
  url "https://github.com/sean-d/the-deaner/releases/download/v0.2.2/the-deaner-v0.2.2-aarch64-apple-darwin.tar.gz"
  version "0.2.2"
  sha256 "b07f8105b8afbc895a07ee460f373d967a893b0299e7b7975f2d77636ea91a53"
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
