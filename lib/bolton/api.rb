module Bolton
  class API
    attr_reader :base_host

    def method_missing(method, *args)
      Wrapper.new(base_host, method, *args)
    end
  end
end
