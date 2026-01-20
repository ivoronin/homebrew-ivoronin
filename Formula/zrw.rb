class Zrw < Formula
  desc "Run commands in Zellij panes and wait for exit code"
  homepage "https://github.com/ivoronin/zrw"
  url "https://github.com/ivoronin/zrw/archive/refs/tags/v2026.01.20.tar.gz"
  sha256 "c16ee16cd79cccf290a7d8e132f11b5f2af9620d1f2b13b0e9cd41c90bee9243"
  license "GPL-3.0"
  head "https://github.com/ivoronin/zrw.git", branch: "main"

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
