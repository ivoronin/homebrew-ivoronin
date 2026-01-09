class Certvet < Formula
  desc "Pre-flight checks for SSL/TLS certificates against real platform trust stores"
  homepage "https://github.com/ivoronin/certvet"
  url "https://github.com/ivoronin/certvet/archive/refs/tags/v2026.01.09.tar.gz"
  sha256 "e75e22ad0a5a8b8b9a74a218af4035122f278c6a92a24c61cb3beeb0e0d8355b"
  license "Elastic-2.0"
  head "https://github.com/ivoronin/certvet.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.Version=#{version}"), "./cmd/certvet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/certvet version")
  end
end
