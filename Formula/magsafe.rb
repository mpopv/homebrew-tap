class Magsafe < Formula
  desc "Control the light on Apple's MagSafe 3 cable"
  homepage "https://github.com/mpopv/magsafe-cli"
  url "https://github.com/mpopv/magsafe-cli.git",
      tag:      "v0.12.0",
      revision: "0e29d5d8232c464ef89283cf9c7c3a8e69871baa"
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
