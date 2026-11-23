class Leka < Formula
  desc "Terminal mail client for Microsoft 365"
  homepage "https://github.com/sean-d/homebrew-tap"
  url "https://github.com/sean-d/homebrew-tap/releases/download/leka-v0.2.1/leka-v0.2.1-aarch64-apple-darwin.tar.gz"
  version "0.2.1"
  sha256 "2980ee2f9000571fce72b58693d0f7acf02d9563ab03b26508c46c0741b90f76"

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
