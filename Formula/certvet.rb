class Certvet < Formula
  desc "Pre-flight checks for SSL/TLS certificates against real platform trust stores"
  homepage "https://github.com/ivoronin/certvet"
  url "https://github.com/ivoronin/certvet/archive/refs/tags/v2026.05.03.tar.gz"
  sha256 "4ecdf0f5730eb6d43c4e7c2d1fc395db08ce6fad7ed60ddc8b6495a4ab10e118"
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
