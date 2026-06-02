class Wch < Formula
  desc "Yet another watch(1) clone"
  homepage "https://github.com/ivoronin/wch"
  url "https://github.com/ivoronin/wch/archive/refs/tags/v2026.06.02.tar.gz"
  sha256 "9293810306408c294a4eff491e54f943f88a61569682830006c1e5cd70b4906c"
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