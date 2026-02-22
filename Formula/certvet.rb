class Certvet < Formula
  desc "Pre-flight checks for SSL/TLS certificates against real platform trust stores"
  homepage "https://github.com/ivoronin/certvet"
  url "https://github.com/ivoronin/certvet/archive/refs/tags/v2026.02.22.tar.gz"
  sha256 "d471569f327001709c1ffa10141a890463f736243da8872cae3539adb87b4774"
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
