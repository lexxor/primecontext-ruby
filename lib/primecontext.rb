require 'primecontext/api'

module Primecontext

  def self.default_options
    {
      api_url: 'https://beta.primecontext.ru/api/crm/new-record/',
      user_id: 0,
      secret_key: '00000000000000000000000000000000'
    }
  end

end
