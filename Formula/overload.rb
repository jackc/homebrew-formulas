require "formula"

class Overload < Formula
  homepage "https://github.com/jackc/overload"
  url "https://github.com/jackc/overload/archive/v0.2.3.tar.gz"
  sha256 "d8f5f6e2fc1dda38f210ec9d1114465bd038eaf14dacdeb06a8e0daeb22f5a80"

  depends_on "go" => :build

  def install
    # Homebrew is on Ruby 1.8.7 so cannot just pass env into system call
    ENV["GOPATH"] = "#{buildpath}/Godeps/_workspace"
    system("go build -o overload")
    bin.install("overload")
  end
end
