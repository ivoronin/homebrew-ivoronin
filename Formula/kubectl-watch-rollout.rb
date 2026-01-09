class KubectlWatchRollout < Formula
  desc "Monitor Kubernetes deployment rollouts with live progress updates"
  homepage "https://github.com/ivoronin/kubectl-watch-rollout"
  url "https://github.com/ivoronin/kubectl-watch-rollout/archive/refs/tags/v2026.01.09.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "GPL-3.0"
  head "https://github.com/ivoronin/kubectl-watch-rollout.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
    ]
    system "go", "build", *std_go_args(ldflags:, output: bin/"kubectl-watch_rollout"), "./cmd/kubectl-watch-rollout"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kubectl-watch_rollout --version")
  end
end
