module PageObjects
  class EmpregadoController
    include HTTParty
    base_uri ENV['URL']

    def initialize
      super
      @cadastrar_path = '/empregado/cadastrar'
      @deletar_path = '/empregado/deletar/'
      @listar_todos_path = '/empregado/list_all'
      @listar_path = '/empregado/list/'
      @username = nil
      @password = nil
      @body = {}
      @header = {
        'Content-Type': 'application/json'
      }
    end

    def set_login(username, password)
      @username = username
      @password = password
    end

    def set_body(body)
      @body = body
    end

    def cadastrar
      options = {
        :body => @body.to_json,
        :basic_auth => get_auth,
        :headers => @header
      }
      self.class.post(@cadastrar_path, options)
    end

    def listar
      options = {
        :basic_auth => get_auth,
        :headers => @header
      }
      self.class.get(@listar_todos_path, options)
    end

    def get_empregado(employe_id)
      verify_employee employe_id
      options = {
        :basic_auth => get_auth,
        :headers => @header
      }
      self.class.get(@listar_path+employe_id.to_s, options)
    end

    def deletar(employe_id)
      verify_employee employe_id
      options = {
        :basic_auth => get_auth,
        :headers => @header
      }
      self.class.delete(@deletar_path+employe_id.to_s, options)
    end
    private

    def get_auth
      raise 'Insira as ifnromação de login e senha' if @username.nil? or @password.nil?
      {:username => @username, :password => @password}
    end

    def verify_employee(employee)
      raise 'Informe o id do empregado' unless employee
    end
  end
end