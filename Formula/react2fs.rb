require "formula"

class React2fs < Formula
  homepage "https://github.com/jackc/react2fs"
  url "https://github.com/jackc/react2fs/archive/v0.2.0.tar.gz"
  sha256 "fbadc3fb775aaca0f8fec459bc71a2076717b5b0465a7b9f0fdde731096ff1ee"

  depends_on "go" => :build

  def install
    # Homebrew is on Ruby 1.8.7 so cannot just pass env into system call
    ENV["GOPATH"] = "#{buildpath}/Godeps/_workspace"
    system("go build -o react2fs")
    bin.install("react2fs")
  end
end
