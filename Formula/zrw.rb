class Zrw < Formula
  desc "Run commands in Zellij panes and wait for exit code"
  homepage "https://github.com/ivoronin/zrw"
  url "https://github.com/ivoronin/zrw/archive/refs/tags/v2026.01.21.tar.gz"
  sha256 "acd94e709a3916e41cfa7f037389fbf9bb29c2e399c19b7c742e3e18ddc087a6"
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
