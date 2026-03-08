class Pll < Formula
  desc "Run shell commands in parallel with output buffering and resumable checkpoints"
  homepage "https://github.com/ivoronin/pll"
  url "https://github.com/ivoronin/pll/archive/refs/tags/v2026.03.08.tar.gz"
  sha256 "c0e3e5b56c2cb992b4855b03a421756706aead67a36b6361c2a825c4792a5b69"
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
