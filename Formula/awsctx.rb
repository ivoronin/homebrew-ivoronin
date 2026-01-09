class Awsctx < Formula
  desc "Tool to manage AWS SDK configuration profiles inspired by kubectx"
  homepage "https://github.com/ivoronin/awsctx"
  url "https://github.com/ivoronin/awsctx/archive/refs/tags/v2025.01.09.tar.gz"
  sha256 "7ed033eb939184856c738247cd87dd911558cc46c8ce1b1d5c02ce88bee34f55"
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
