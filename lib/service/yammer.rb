module Service
  class Yammer < Base
    URL = "https://www.yammer.com/"
    NETWORK_NAME = 'actindi.net'
    LOGIN_PATH = '/?show_login=true'

    def initialize(username)
      super()
      @username = username
    end

    def add
      visit root_path
    end

    def rm
    end

    def exist?
    end

    def login
      visit login_url
      login_name = OperationProperty.get(:yammer, :system, :username)
      password =   OperationProperty.get(:yammer, :system, :password)
      # fill_in '#login', with: login_name # Unable to find field "#login" になる
      page.execute_script("$('#login').val('#{login_name}')")
      page.execute_script("$('#password').val('#{password}')")
      click_button('Log In')
    end

    def quit
    end

    private

    def login_url
      URL + NETWORK_NAME + LOGIN_PATH
    end
  end
end
