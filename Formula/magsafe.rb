class Magsafe < Formula
  desc "Control the light on Apple's MagSafe 3 cable"
  homepage "https://github.com/mpopv/magsafe-cli"
  url "https://github.com/mpopv/magsafe-cli.git",
      tag:      "v0.11.0",
      revision: "f0d0a86c4cd0264d2aef59942e16049ec2bac613"
  license "MIT"
  head "https://github.com/mpopv/magsafe-cli.git", branch: "main"

  depends_on arch: :arm64
  depends_on :macos

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/magsafe --version")
    assert_match '"dry_run":true', shell_output("#{bin}/magsafe --json --dry-run led blink green")
  end
end
