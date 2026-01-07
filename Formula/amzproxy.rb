class Amzproxy < Formula
  desc "Lightweight HTTP proxy that signs requests using AWS SigV4"
  homepage "https://github.com/ivoronin/amzproxy"
  url "https://github.com/ivoronin/amzproxy/archive/refs/tags/2025.05.12.tar.gz"
  sha256 "e8203b42e034a54ec89cc6ff25a9d3fba8a1bb4c96bed747b6e8d3b28f359d8c"
  license :cannot_represent
  head "https://github.com/ivoronin/amzproxy.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "amzproxy", shell_output("#{bin}/amzproxy --help 2>&1")
  end
end
