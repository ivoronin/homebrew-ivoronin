class Krun < Formula
  desc "Run one-off commands in Kubernetes pods interactively"
  homepage "https://github.com/ivoronin/krun"
  url "https://github.com/ivoronin/krun/archive/refs/tags/2024.11.11.tar.gz"
  sha256 "c939085c8dda2c22da552d613b9c37c329f118b25e1a32e3db01be8383a5fafe"
  license :cannot_represent
  head "https://github.com/ivoronin/krun.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "krun", shell_output("#{bin}/krun --help 2>&1")
  end
end
