class Amzcurl < Formula
  desc "Minimal curl wrapper with AWS SigV4 authentication"
  homepage "https://github.com/ivoronin/amzcurl"
  url "https://github.com/ivoronin/amzcurl/archive/refs/tags/2025.05.07.tar.gz"
  sha256 "1141ed5a2e95cf41822d07b3aa2c33130dd59b36129d4b115f15a927143de87d"
  license :cannot_represent
  head "https://github.com/ivoronin/amzcurl.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "amzcurl", shell_output("#{bin}/amzcurl --help 2>&1", 1)
  end
end
