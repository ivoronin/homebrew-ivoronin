class Krun < Formula
  desc "Run one-off commands in Kubernetes pods interactively"
  homepage "https://github.com/ivoronin/krun"
  url "https://github.com/ivoronin/krun/archive/refs/tags/v2026.01.09.tar.gz"
  sha256 "eb6690de70a27965255e0e081fa0178cef51e05a4a5fb8201de301551d93907d"
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
