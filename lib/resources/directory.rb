# encoding: utf-8

require 'resources/file'

module Inspec::Resources
  class Directory < FileResource
    name 'directory'
    supports platform: 'unix'
    supports platform: 'windows'
    desc 'Use the directory InSpec audit resource to test if the file type is a directory. This is equivalent to using the file InSpec audit resource and the be_directory matcher, but provides a simpler and more direct way to test directories. All of the matchers available to file may be used with directory.'
    example "
      describe directory('path') do
        it { should be_directory }
      end
    "

    def exist?
      file.exist? && file.directory?
    end

    def to_s
      "Directory #{source_path}"
    end
  end
end
