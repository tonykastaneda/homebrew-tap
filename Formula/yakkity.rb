class Yakkity < Formula
  desc "Search, resume, and hand off conversations between coding agents"
  homepage "https://yakkity.dev"
  url "https://github.com/tonykastaneda/yakkity/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "df8c7f01a9e64970039d1c2febceed9e220353432434c0d4cd377d1c5cdfc8cc"
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
    assert_match "yakkity 0.3.1", shell_output("#{bin}/yakk --version")
    assert_match "Usage: yakk", shell_output("#{bin}/yakk --help")
  end
end
