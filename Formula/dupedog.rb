class Dupedog < Formula
  desc "High-performance duplicate file finder and deduplicator"
  homepage "https://github.com/ivoronin/dupedog"
  url "https://github.com/ivoronin/dupedog/archive/refs/tags/v2026.01.08.tar.gz"
  sha256 "6c7b7941850609840f803dbd94548f0950cd2f93a71a85ec1fbaa836e647f3de"
  license "MIT"
  head "https://github.com/ivoronin/dupedog.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/dupedog"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dupedog --version")
  end
end
