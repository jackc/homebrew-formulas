require "formula"

class Overload < Formula
  homepage "https://github.com/JackC/overload"
  url "https://github.com/JackC/overload/archive/v0.2.3.tar.gz"
  sha1 "86552b7e4393e190863a8266d51c1dbae2083817"

  depends_on "go" => :build

  def install
    # Homebrew is on Ruby 1.8.7 so cannot just pass env into system call
    ENV["GOPATH"] = "#{buildpath}/Godeps/_workspace"
    system("go build -o overload")
    bin.install("overload")
  end
end
