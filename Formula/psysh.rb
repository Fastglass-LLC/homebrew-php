require File.expand_path("../../language/php", __FILE__)
require File.expand_path("../../Requirements/php-meta-requirement", __FILE__)

class Psysh < Formula
  include Language::PHP::Composer

  desc "Runtime developer console, interactive debugger & REPL"
  homepage "https://github.com/bobthecow/psysh"
  url "https://github.com/bobthecow/psysh/archive/v0.8.11.tar.gz"
  sha256 "6ef230e112c35c8116d55f92eaf9d20ae322425814f7a3f64750c9e13cadb57a"
  head "https://github.com/bobthecow/psysh.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "f36b9284f70fe73ee5935b70ab381258640f5fe9153e50c992a63145adb4e95d" => :sierra
    sha256 "dffd58943c29893e0f7996bf78bc5fffdab6c3feab86529b37f78f653328fb9e" => :el_capitan
    sha256 "3fda359152cbf105221b3b164794924f584e6540943bebaeef33e82d0732f21a" => :yosemite
  end

  depends_on PhpMetaRequirement

  def install
    composer_install "--no-dev"
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/psysh"
  end

  test do
    system "#{bin}/psysh", "--version"
  end
end
