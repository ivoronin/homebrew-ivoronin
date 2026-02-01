class Wch < Formula
  desc "Yet another watch(1) clone"
  homepage "https://github.com/ivoronin/wch"
  url "https://github.com/ivoronin/wch/archive/refs/tags/v2026.02.01.tar.gz"
  sha256 "9a45bb91def46acd41e4f4bd67709b7737afc9ec2f0805c0f52cecd3e1fdc377"
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
