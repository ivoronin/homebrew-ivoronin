class Amzcurl < Formula
  desc "Minimal curl wrapper with AWS SigV4 authentication"
  homepage "https://github.com/ivoronin/amzcurl"
  url "https://github.com/ivoronin/amzcurl/archive/refs/tags/v2026.01.09.tar.gz"
  sha256 "e184fd7f14382c928868ea64aac9348ec86c2a38fc0c066d7b55a07dddbf0d91"
  license "GPL-3.0"
  head "https://github.com/ivoronin/amzcurl.git", branch: "main"

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
