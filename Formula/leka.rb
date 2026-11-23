class Leka < Formula
  desc "Terminal mail client for Microsoft 365"
  homepage "https://github.com/sean-d/homebrew-tap"
  url "https://github.com/sean-d/homebrew-tap/releases/download/leka-v0.3.0/leka-v0.3.0-aarch64-apple-darwin.tar.gz"
  version "0.3.0"
  sha256 "7ead0bd079d08be405daf2632e3d170450a9876cbe176edf4985f46b0c2e7650"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "leka"
    doc.install "README.md", "CHANGELOG.md"
  end

  def caveats
    <<~EOS
      leka needs ~/.config/leka/microsoft.json, the IDs of its Microsoft 365 app: copy it
      from a machine that has it. Then `leka login` once, and `leka`.

      Messages are written in $EDITOR (Neovim if it isn't set): `brew install neovim`.
    EOS
  end

  test do
    assert_match "leka", shell_output("#{bin}/leka --version")
  end
end
