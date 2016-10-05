module Bolton
  class API
    attr_reader :base_host, :basic_auth

    def method_missing(method, *args)
      Wrapper.new(base_host, method, basic_auth, *args)
    end
  end
end
