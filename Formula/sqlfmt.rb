require "formula"

class Sqlfmt < Formula
  homepage "https://github.com/jackc/sqlfmt"
  url "https://github.com/jackc/sqlfmt/archive/v0.0.1.tar.gz"
  sha1 "380c07c92650cdef3b66e56f618d47282c41ceb5"

  depends_on "go" => :build

  def install
    system("go build -o sqlfmt")
    bin.install("sqlfmt")
  end
end
