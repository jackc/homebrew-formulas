require "formula"

class React2fs < Formula
  homepage "https://github.com/jackc/react2fs"
  url "https://github.com/jackc/react2fs/archive/v0.2.0.tar.gz"
  sha1 "49312bd279db4a5f216071459c30774ff0bc9e95"

  depends_on "go" => :build

  def install
    # Homebrew is on Ruby 1.8.7 so cannot just pass env into system call
    ENV["GOPATH"] = "#{buildpath}/Godeps/_workspace"
    system("go build -o react2fs")
    bin.install("react2fs")
  end
end
