class Pll < Formula
  desc "Run shell commands in parallel with output buffering and resumable checkpoints"
  homepage "https://github.com/ivoronin/pll"
  url "https://github.com/ivoronin/pll/archive/refs/tags/v2026.02.17.tar.gz"
  sha256 "0cbd314a409bd991845976afa952c58c5b25ceb4bb0f7f48d763026ae68ac90d"
  license "GPL-3.0"
  head "https://github.com/ivoronin/pll.git", branch: "master"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
    ]
    system "go", "build", *std_go_args(ldflags:), "./cmd/#{name}"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/#{name} --version")
  end
end
