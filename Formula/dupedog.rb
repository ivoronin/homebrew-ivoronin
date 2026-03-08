class Dupedog < Formula
  desc "High-performance duplicate file finder and deduplicator"
  homepage "https://github.com/ivoronin/dupedog"
  url "https://github.com/ivoronin/dupedog/archive/refs/tags/v2026.03.08.tar.gz"
  sha256 "1ac1dfd9a6acb12e30cac3b8819acfde94c1e07e148c8f79df26e0f5dd78ac23"
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
