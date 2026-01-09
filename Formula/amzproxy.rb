class Amzproxy < Formula
  desc "Lightweight HTTP proxy that signs requests using AWS SigV4"
  homepage "https://github.com/ivoronin/amzproxy"
  url "https://github.com/ivoronin/amzproxy/archive/refs/tags/v2025.05.12.tar.gz"
  sha256 "e8203b42e034a54ec89cc6ff25a9d3fba8a1bb4c96bed747b6e8d3b28f359d8c"
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
