class Clibana < Formula
  desc "CLI tool for OpenSearch with Kibana-like log searching and live tailing"
  homepage "https://github.com/ivoronin/clibana"
  url "https://github.com/ivoronin/clibana/archive/refs/tags/2025.11.18.tar.gz"
  sha256 "62b5070902fbbf6224da9d4f7b7b9c1add1690ba15e4f586461fa9f4b1b82ebd"
  license :cannot_represent
  head "https://github.com/ivoronin/clibana.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
      -X main.commit=v#{version}
      -X main.date=#{time.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags:)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/clibana --version")
  end
end
