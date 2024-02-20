class PasswordsController < ApplicationController
  def index
    @generated_password = session.delete(:generated_password)
  end

  def reset_fields
    session.delete(:generated_password)
    redirect_to root_path
  end


  def generate_password
    if params[:action] == 'reset'
      session.delete(:generated_password)
      redirect_to root_path
      return
    end

    length = params[:length].to_i
    include_uppercase = params[:include_uppercase] == '1'
    include_lowercase = params[:include_lowercase] == '1'
    include_numbers = params[:include_numbers] == '1'

    characters = []
    characters += ('A'..'Z').to_a if include_uppercase
    characters += ('a'..'z').to_a if include_lowercase
    characters += ('0'..'9').to_a if include_numbers

    if characters.empty?
      flash[:alert] = "Selecione pelo menos uma opção."
      redirect_to root_path
      return
    end

    password = ''
    password += characters.sample if include_uppercase
    password += characters.sample if include_lowercase
    password += characters.sample if include_numbers

    # Preencha o restante da senha com caracteres aleatórios
    remaining_length = length - password.length
    remaining_length.times { password += characters.sample }

    # Embaralhe a senha para garantir que os caracteres estejam misturados
    password = password.chars.shuffle.join

    session[:generated_password] = password
    redirect_to root_path, notice: 'Senha gerada com sucesso!'
  end
end
