class Ec2ssh < Formula
  desc "Simplify SSH connections to AWS EC2 instances"
  homepage "https://github.com/ivoronin/ec2ssh"
  url "https://github.com/ivoronin/ec2ssh/archive/refs/tags/2025.12.11.tar.gz"
  sha256 "1245621198a82ebc6b47df079cecb44ab3f6cad58b17dc59ede16dabbca9df4e"
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
    assert_match version.to_s, shell_output("#{bin}/ec2ssh --version")
  end
end
