class Awsctx < Formula
  desc "Tool to manage AWS SDK configuration profiles inspired by kubectx"
  homepage "https://github.com/ivoronin/awsctx"
  url "https://github.com/ivoronin/awsctx/archive/refs/tags/v2026.01.09.tar.gz"
  sha256 "127eb95b2b520481e6c06ca7298c9b641126043af09bc6eb808225a5183219b5"
  license "GPL-3.0"
  head "https://github.com/ivoronin/awsctx.git", branch: "main"

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
