class Certvet < Formula
  desc "Pre-flight checks for SSL/TLS certificates against real platform trust stores"
  homepage "https://github.com/ivoronin/certvet"
  url "https://github.com/ivoronin/certvet/archive/refs/tags/v2026.01.01.tar.gz"
  sha256 "f000976222691630330447f4cb2611c7c1ed597a0d6eb616b68c52ead5c20684"
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
