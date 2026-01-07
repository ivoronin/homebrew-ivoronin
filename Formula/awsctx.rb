class Awsctx < Formula
  desc "Tool to manage AWS SDK configuration profiles inspired by kubectx"
  homepage "https://github.com/ivoronin/awsctx"
  url "https://github.com/ivoronin/awsctx/archive/refs/tags/2024.08.10.tar.gz"
  sha256 "78708555b58031f9e488eb380e5d95beb67a8eab20ee7a3391067d01b31df62f"
  license :cannot_represent
  head "https://github.com/ivoronin/awsctx.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
      -X main.commit=v#{version}
      -X main.date=#{time.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags:)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/awsctx --version")
  end
end
