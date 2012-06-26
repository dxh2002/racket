# $Id$

require 'rubygems'
SPEC = Gem::Specification.new do |s|
  s.name = "racket"
  s.version = "1.0.13"
  s.author = "Jon Hart"
  s.email = "jhart@spoofed.org"
  s.homepage = "http://spoofed.org/files/racket/"
  s.description = "Ruby Gem for reading and writing raw packets"
  s.platform = Gem::Platform::RUBY
  s.summary = s.description
  candidates =  Dir.glob("{bin,docs,examples,lib,test}/**/*")
  s.files = candidates.delete_if do |item|
              item.include?("CVS") || item.include?("rdoc") || item.include?(".svn")
            end
  s.require_path = "lib"
  # bit-struct is required and works without issue on most/all platforms
  s.add_dependency("bit-struct")
  # pcaprub is required for packet writing only, but can be very problematic
  s.requirements << "pcaprub"
  s.test_files = Dir.glob("test/ts_*.rb")
  s.has_rdoc = true
  s.rdoc_options << "-A rest,octets,hex_octets,unsigned,signed,text,rest"
  s.rdoc_options << "-p"
  s.rdoc_options << "-m" << "README"
  s.rdoc_options << "-W http://spoofed.org/files/racket/src/%s"
  s.extra_rdoc_files = ["README"]
end
# vim: set ts=2 et sw=2:
