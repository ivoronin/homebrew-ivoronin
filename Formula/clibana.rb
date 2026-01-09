class Clibana < Formula
  desc "CLI tool for OpenSearch with Kibana-like log searching and live tailing"
  homepage "https://github.com/ivoronin/clibana"
  url "https://github.com/ivoronin/clibana/archive/refs/tags/v2026.01.09.tar.gz"
  sha256 "4caaddb6951af54e7970a096cb7e365adf49998146c9e58cdba14f9f0e139dc1"
  license "GPL-3.0"
  head "https://github.com/ivoronin/clibana.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
      -X main.commit=v#{version}
      -X main.date=#{time.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags:), "./cmd/#{name}"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/#{name} --version")
  end
end
