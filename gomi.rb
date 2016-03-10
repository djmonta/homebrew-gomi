require "formula"

class Gomi < Formula
    homepage "https://github.com/b4b4r07/gomi"
    version "0.1.6"
    if OS.mac?
        if Hardware.is_64_bit?
            url "https://github.com/b4b4r07/gomi/releases/download/v#{version}/gomi_darwin_amd64"
            KIND="amd64"
        else
            url "https://github.com/b4b4r07/gomi/releases/download/v#{version}/gomi_darwin_386"
            KIND="386"
        end
    elsif OS.linux?
    end
    
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
