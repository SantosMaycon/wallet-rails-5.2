module ApplicationHelper
    def data_br(data_us)
        data_us.strftime("%d/%m/%Y")
    end
    
    def ambiente_rails
        if Rails.env.production?
            "Produção"
        elsif Rails.env.development?
            "Desenvolvimento"
        else
            "Teste"
        end
    end
end
