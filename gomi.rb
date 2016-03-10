require "formula"

class Gomi < Formula
    homepage "https://github.com/b4b4r07/gomi"
    version "0.1.6"
    url "https://github.com/b4b4r07/gomi/releases/download/v#{version}/gomi"
    sha1 "2b3b5db55a6f6789fe8a649cc56f89f0fd487640"

    def install
        bin.install 'gomi'
        system "curl -L https://raw.githubusercontent.com/b4b4r07/gomi/master/completions/zsh/_gomi >_gomi"
        zsh_completion.install "_gomi"
    end

    test do
        system "#{bin}/gomi", "--help"
    end

    def caveats; msg = <<-'EOS'
                       _ 
                      (_)
  __ _  ___  _ __ ___  _ 
 / _` |/ _ \| '_ ` _ \| |
| (_| | (_) | | | | | | |
 \__, |\___/|_| |_| |_|_|
  __/ |                  
 |___/                   

  Type `gomi --help' to start

        EOS
    end
end
