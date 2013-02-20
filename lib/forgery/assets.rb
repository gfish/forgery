class Forgery

  class Assets

    def initialize
      @assets = {}
    end

    def [](key)
      symbolized_key = key.to_sym
      @assets[symbolized_key] ||= Forgery::Extend(FileReader.read_assets(symbolized_key))
    end

    def loaded?(key)
      @assets.has_key?(key.to_sym)
    end

    def reset!
      @assets = {}
    end

  end

end
