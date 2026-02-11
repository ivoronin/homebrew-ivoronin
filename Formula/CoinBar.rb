class Coinbar < Formula
  desc "Track cryptocurrency prices from the macOS menu bar"
  homepage "https://github.com/ivoronin/CoinBar"
  url "https://github.com/ivoronin/CoinBar/archive/refs/tags/PLACEHOLDER.tar.gz"
  sha256 "PLACEHOLDER"
  license "GPL-3.0-only"
  head "https://github.com/ivoronin/CoinBar.git", branch: "main"

  depends_on :macos
  depends_on xcode: ["16.0", :build]

  def install
    system "make", "app"
    prefix.install "CoinBar.app"
  end

  test do
    assert_predicate prefix/"CoinBar.app/Contents/MacOS/CoinBar", :executable?
  end
end
