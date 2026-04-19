class Certvet < Formula
  desc "Pre-flight checks for SSL/TLS certificates against real platform trust stores"
  homepage "https://github.com/ivoronin/certvet"
  url "https://github.com/ivoronin/certvet/archive/refs/tags/v2026.04.19.tar.gz"
  sha256 "ce76c0734f0242f08915c60659ea451f479c009f47b240ad6f21fd9df3665c3b"
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
