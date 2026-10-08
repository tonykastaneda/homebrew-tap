class Yakkity < Formula
  desc "Search, resume, and hand off conversations between coding agents"
  homepage "https://yakkity.dev"
  url "https://github.com/tonykastaneda/yakkity/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "6ee2c9aa028c7174f41d617c878ce43f37e8c1b7a7ee9d757c0b25dec420b7c6"
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
    assert_match "yakkity 0.3.2", shell_output("#{bin}/yakk --version")
    assert_match "Usage: yakk", shell_output("#{bin}/yakk --help")
  end
end
