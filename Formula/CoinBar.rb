class Coinbar < Formula
  desc "Track cryptocurrency prices from the macOS menu bar"
  homepage "https://github.com/ivoronin/CoinBar"
  url "https://github.com/ivoronin/CoinBar/archive/refs/tags/v2026.02.11.tar.gz"
  sha256 "e957aa23e730ddcd6d63c0a56e27acb5fc52588ff1fd1bceda3a35e03e2c7354"
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
