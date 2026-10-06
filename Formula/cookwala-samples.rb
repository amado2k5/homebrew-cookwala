# Homebrew formula for a tap: brew tap amado2k5/cookwala && brew install cookwala-samples
# Rendered by samples/packaging/build.py; copy the rendered file into the tap repository (Formula/).
class CookwalaSamples < Formula
  desc "Cookwala sample clients, agents, orchestrators, gates, recovery and reporting"
  homepage "https://cookwala.ai"
  url "https://github.com/amado2k5/cookwala/releases/download/samples-v0.3.0/cookwala-samples-0.3.0.pyz"
  sha256 "ee185307912b89d0868c7d2e8fd8264abc64af592b2d3eb4e48ade653642aedb"
  license "Apache-2.0"

  depends_on "python@3.12"

  def install
    libexec.install "cookwala-samples-#{version}.pyz" => "cookwala-samples.pyz"
    (bin/"cookwala-samples").write <<~SH
      #!/bin/sh
      exec "#{Formula["python@3.12"].opt_bin}/python3.12" "#{libexec}/cookwala-samples.pyz" "$@"
    SH
  end

  test do
    assert_match "cookwala-samples #{version}", shell_output("#{bin}/cookwala-samples version")
    assert_match "completed", shell_output("#{bin}/cookwala-samples demo")
  end
end
