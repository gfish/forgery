class Forgery

  class FileReader

    # Returns an array of strings containing each line in the dictionary
    def self.read_dictionary(dictionary)
      read_file(find_file(dictionary, :dictionaries))
    end

    # Returns an array of strings containing each line in the format
    def self.read_format(format)
      read_file(find_file(format, :formats))
    end

    # Returns an array of strings containing each file in the directory
    def self.read_assets(asset_type)
      dir = find_dir(asset_type, :assets)
      (Dir.new(dir).entries - ['.','..']).map { |entry| File.join(dir,entry) }


      # Dir.entries(dir).select do |entry|
      #   File.file? File.join(dir,entry) and !(entry =='.' || entry == '..')
      # end.map { |entry| }
      # Dir.new(dir).entries - ['.','..']
    end

  protected

    # Reads a file while stripping leading and trailing whitespace, including
    # newlines
    def self.read_file(file)
      lines = []
      IO.foreach(file) do |line|
        lines << line.strip unless line.strip == ''
      end
      lines
    end

    # Search a file in all load_paths, starting from last to first, so
    # last takes precedence over first.
    def self.find_file(name, folder)
      Forgery.load_paths.reverse.each do |path|
        file = "#{path}/#{folder}/#{name}"
        return file if File.exists?(file)
      end
      raise ArgumentError.new("File '#{name}' wasn't found in '#{folder}' folder. Searched paths: \n#{Forgery.load_paths.join('\n')}")
    end

    # Search a dir in all load_paths, starting from last to first, so
    # last takes precedence over first.
    def self.find_dir(name, folder)
      Forgery.load_paths.reverse.each do |path|
        dir = "#{path}/#{folder}/#{name}"
        return dir if Dir.exists?(dir)
      end
      raise ArgumentError.new("Folder '#{name}' wasn't found in '#{folder}' folder. Searched paths: \n#{Forgery.load_paths.join('\n')}")
    end
  end
end
