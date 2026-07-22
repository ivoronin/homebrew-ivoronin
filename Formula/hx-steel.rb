class HxSteel < Formula
  desc "Helix editor with Steel as a plugin language"
  homepage "https://github.com/mattwparas/helix/blob/steel-event-system/STEEL.md"
  license all_of: [
    "MPL-2.0",
    { any_of: ["Apache-2.0", "MIT"] },
  ]

  stable do
    url "https://github.com/mattwparas/helix/archive/0522d519fd5227f77ecef387a87e51b732907562.tar.gz"
    version "25.7.1-steel-20260622"
    sha256 "621d2c4d60cb6e94a56971df2f5d1375937c2744eb0509b9cebc617454113ea1"

    resource "steel" do
      url "https://github.com/mattwparas/steel/archive/dec633b908afeafeaf62bab457a92e2bf873745a.tar.gz"
      sha256 "5559f4529b1a49dded6fda63240b163ca6e197154d3849948eb0f88a690afa12"
    end
  end

  head do
    url "https://github.com/mattwparas/helix.git", branch: "steel-event-system"

    resource "steel" do
      url "https://github.com/mattwparas/steel.git", branch: "master"
    end
  end

  depends_on "rust" => :build

  conflicts_with "evil-helix", because: "both install `hx` binaries"
  conflicts_with "helix", because: "both install `hx` binaries"
  conflicts_with "hex", because: "both install `hx` binaries"

  def install
    resource("steel").stage do
      # Build the workspace packages together so Cargo only compiles the shared Steel runtime once.
      system "cargo", "build", "--release", "--locked", "--lib", "--bins",
             "--package", "steel-interpreter",
             "--package", "steel-language-server",
             "--package", "cargo-steel-lib",
             "--package", "steel-forge"
      bin.install "target/release/steel",
                  "target/release/steel-language-server",
                  "target/release/cargo-steel-lib",
                  "target/release/forge"
    end

    ENV["HELIX_DEFAULT_RUNTIME"] = libexec/"runtime"
    system "cargo", "install", "-vv", *std_cargo_args(path: "helix-term"),
           "--no-default-features", "--features", "steel,git"
    rm_r "runtime/grammars/sources/"
    libexec.install "runtime"

    bash_completion.install "contrib/completion/hx.bash" => "hx"
    fish_completion.install "contrib/completion/hx.fish"
    zsh_completion.install "contrib/completion/hx.zsh" => "_hx"

    doc.install "STEEL.md", "steel-docs.md"
  end

  test do
    assert_match "post-modern text editor", shell_output("#{bin}/hx --help")
    assert_match "✓", shell_output("#{bin}/hx --health")
    assert_match "Steel repl and command line interface", shell_output("#{bin}/steel --help")

    %w[cargo-steel-lib forge steel-language-server].each do |executable|
      assert_path_exists bin/executable
    end
  end
end
