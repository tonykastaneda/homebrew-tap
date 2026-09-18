class Yakkity < Formula
  desc "Search, resume, and hand off conversations between coding agents"
  homepage "https://yakkity.dev"
  url "https://github.com/tonykastaneda/yakkity/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "0b08c2b1fa5be2a99282d0345807eb4dde7dc1891fc2a5b414e79b829a38c6cc"
  license "MIT"
  head "https://github.com/tonykastaneda/yakkity.git", branch: "main"

  depends_on "fzf"
  depends_on "jq"
  depends_on :macos

  def install
    bin.install "yakk.zsh" => "yakk"
    man1.install "man/yakk.1" if (buildpath/"man/yakk.1").exist?
  end

  test do
    assert_match "yakkity 0.3.0", shell_output("#{bin}/yakk --version")
    assert_match "Usage: yakk", shell_output("#{bin}/yakk --help")
  end
end
