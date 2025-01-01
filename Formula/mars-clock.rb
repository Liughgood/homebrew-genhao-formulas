class MarsClock < Formula
  desc "Command-line program of mars clock. Only print current AMT or usage"
  homepage "https://liughgood.github.io/GenhaoLog/"
  url "https://github.com/Liughgood/mars-clock/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "e405380e17b65d916f42298772478a1e36702e5b23e47e8fc9e49f1aba888541"
  license "MIT"

  depends_on "make" => :build

  def install
    mkdir "obj"
    mkdir "bin"
    system "make", "main"
    bin.install "bin/mars-clock"
  end

  test do
    # Test if the mars-clock binary runs and outputs the expected help message
    output = shell_output("#{bin}/mars-clock --help")
    assert_match "Usage: mars-clock [options]", output
  end
end
