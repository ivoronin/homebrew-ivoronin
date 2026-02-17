class Coinbar < Formula
  desc "Track cryptocurrency prices from the macOS menu bar"
  homepage "https://github.com/ivoronin/CoinBar"
  url "https://github.com/ivoronin/CoinBar/archive/refs/tags/2026.02.17.tar.gz"
  sha256 "cfaf57da2357bb48117fb15d6af325214128a576db56771ecdf502b225fb2836"
  license "GPL-3.0-only"
  head "https://github.com/ivoronin/CoinBar.git", branch: "main"

  depends_on :macos
  depends_on xcode: ["16.0", :build]

  def install
    system "make", "app", "VERSION=#{version}"
    prefix.install "CoinBar.app"
  end

  def caveats
    <<~EOS
      CoinBar.app was installed to:
        #{prefix}/CoinBar.app

      To link it to /Applications:
        ln -sf #{prefix}/CoinBar.app /Applications/CoinBar.app
    EOS
  end

  test do
    assert_predicate prefix/"CoinBar.app/Contents/MacOS/CoinBar", :executable?
  end
end
