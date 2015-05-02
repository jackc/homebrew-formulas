require "formula"

class Tern < Formula
  homepage "https://github.com/jackc/tern"
  url "https://github.com/jackc/tern/archive/v1.3.3.tar.gz"
  sha1 "976242e9a8df29b33e0680c67eec7493aabec3e6"

  depends_on "go" => :build

  def install
    # Homebrew is on Ruby 1.8.7 so cannot just pass env into system call
    ENV["GOPATH"] = "#{buildpath}/Godeps/_workspace"

    # Don't want to depend on godep for build so move nested package into correct place in godep
    system("mkdir -p #{buildpath}/Godeps/_workspace/src/github.com/jackc/tern")
    system("mv #{buildpath}/migrate #{buildpath}/Godeps/_workspace/src/github.com/jackc/tern")

    system("go build -o tern")
    bin.install("tern")
  end
end
