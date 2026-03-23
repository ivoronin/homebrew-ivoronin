class Wch < Formula
  desc "Yet another watch(1) clone"
  homepage "https://github.com/ivoronin/wch"
  url "https://github.com/ivoronin/wch/archive/refs/tags/v2026.03.23.tar.gz"
  sha256 "af8c66debb8d07c88571bbc68373e7fd9fbbfb54b71e1b03c8e560098637e6e1"
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
