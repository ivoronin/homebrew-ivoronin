class Amzproxy < Formula
  desc "Lightweight HTTP proxy that signs requests using AWS SigV4"
  homepage "https://github.com/ivoronin/amzproxy"
  url "https://github.com/ivoronin/amzproxy/archive/refs/tags/v2026.01.09.tar.gz"
  sha256 "f41a2e332e653f4fd751ea974e8feecb5401023d972118a58d7952ce89689dfe"
  license "GPL-3.0"
  head "https://github.com/ivoronin/amzproxy.git", branch: "main"

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
