class Wch < Formula
  desc "Yet another watch(1) clone"
  homepage "https://github.com/ivoronin/wch"
  url "https://github.com/ivoronin/wch/archive/refs/tags/v2026.02.27.tar.gz"
  sha256 "44695743b35799ac3a2caf3db293b96b2b7b76a7ba2a9a8dc6e9660d2fad2ba7"
  license "GPL-3.0"
  head "https://github.com/ivoronin/wch.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
    ]
    system "go", "build", *std_go_args(ldflags:), "./cmd/#{name}"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/#{name} --version")
  end
end
