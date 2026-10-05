class Magsafe < Formula
  desc "Control the light on Apple's MagSafe 3 cable"
  homepage "https://github.com/mpopv/magsafe-cli"
  url "https://github.com/mpopv/magsafe-cli.git",
      tag:      "v0.9.0",
      revision: "c598f311dacbbfc2bb40e7cc64e979995e1a54ad"
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
