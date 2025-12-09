class Ec2ssh < Formula
  desc "Simplify SSH connections to AWS EC2 instances"
  homepage "https://github.com/ivoronin/ec2ssh"
  url "https://github.com/ivoronin/ec2ssh/archive/refs/tags/2025.12.09.tar.gz"
  sha256 "d87eedf9dc792a4dcf110872ed10b3cd8a4fea90f1f1573414c4260c0bd9bc20"
  license "GPL-3.0-only"
  head "https://github.com/ivoronin/ec2ssh.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/ec2ssh"

    bin.install_symlink "ec2ssh" => "ec2scp"
    bin.install_symlink "ec2ssh" => "ec2sftp"
    bin.install_symlink "ec2ssh" => "ec2list"
    bin.install_symlink "ec2ssh" => "ec2ssm"
  end

  test do
    assert_match "ec2ssh", shell_output("#{bin}/ec2ssh --help 2>&1", 2)
  end
end
