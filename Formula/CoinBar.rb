class Coinbar < Formula
  desc "Track cryptocurrency prices from the macOS menu bar"
  homepage "https://github.com/ivoronin/CoinBar"
  url "https://github.com/ivoronin/CoinBar/archive/refs/tags/2026.02.11.tar.gz"
  sha256 "beab9c440341ffa0804e45c61cee9730b567d118ad5e4d9ee6cad15a939eca97"
  license "GPL-3.0-only"
  head "https://github.com/ivoronin/CoinBar.git", branch: "main"

  depends_on :macos
  depends_on xcode: ["16.0", :build]

  def install
    system "make", "app", "VERSION=#{version}"
    prefix.install "CoinBar.app"
  end

  test do
    assert_predicate prefix/"CoinBar.app/Contents/MacOS/CoinBar", :executable?
  end
end
