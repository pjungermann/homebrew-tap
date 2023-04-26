class HelpCmd < Formula
  desc "help command which combines tldr and cheat."
  homepage "https://github.com/pjungermann/homebrew-tap"
  url "file:///dev/null"
  version "1.0.0"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  license "MIT"

  depends_on "cheat"
  depends_on "tldr"

  def install
    (bin+"help").write <<~SH
      #!/bin/sh
      
      tldr "${@}"
      echo
      cheat "${@}"
    SH
  end

  def caveats
    <<~EOS
      Recommended config for cheat (~/.config/cheat/conf.yaml)

        colorize: true
        pager: ""
        style: "vs"

    EOS
  end

  test do
    output = shell_output("#{bin}/help sed", 1)
    assert_match "Edit text in a scriptable manner", output
  end
end

