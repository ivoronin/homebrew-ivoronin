class Zrw < Formula
  desc "Run commands in Zellij panes and wait for exit code"
  homepage "https://github.com/ivoronin/zrw"
  url "https://github.com/ivoronin/zrw/archive/refs/tags/v2026.03.08.tar.gz"
  sha256 "0658195cea07406231f3598f82c9f2ad60064d08df9cf2add1daa09f4a5a48b2"
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
