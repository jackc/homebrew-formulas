require "formula"

class React2fs < Formula
  homepage "https://github.com/jackc/react2fs"
  url "https://github.com/jackc/react2fs/archive/v0.1.2.tar.gz"
  sha1 "0e712b0202a77479bd9146b3f1d08a1bceb3ac88"

  depends_on "go" => :build

  def install
    # Homebrew is on Ruby 1.8.7 so cannot just pass env into system call
    ENV["GOPATH"] = "#{buildpath}/Godeps/_workspace"
    system("go build -o react2fs")
    bin.install("react2fs")
  end
end
