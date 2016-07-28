class WebMotorsClient
  include HTTParty
  attr_accessor :make_id

  base_uri 'http://www.webmotors.com.br'

  def models
    return nil unless make_id
    self.class.post('/carro/modelos', { body: {marca: make_id} })
  end

  def makes
    self.class.post('/carro/marcas')
  end

end