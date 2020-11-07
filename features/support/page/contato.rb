class ContatoPage < SitePrism::Page
  set_url "/"
  element :btn_contato, :xpath, "//a[@data-testid='linkElement']/div/div/p[text()='CONTATO']"
  element :input_nome_completo, "input[placeholder='Nome Completo']"
  element :input_empresa, "input[placeholder='Empresa']"
  element :input_email, "input[placeholder='E-mail']"
  element :input_fone, "input[placeholder='Fone']"
  element :text_mensagem, "textarea[placeholder='Mensagem']"
  element :captcha, :xpath, "//div/iframe[@role='presentation']"

  def clicar_btn_contato
    puts "Clicando no botão Contato"
    btn_contato.click
  end

  def dados_contato
    page.execute_script("window.scrollTo(0, 1000)")
    sleep(6)
    puts "Informando os dados para Contato"

    input_nome_completo.set("Hellen Alves de Sousa Silva")
    input_empresa.set("Verity")
    input_email.set("hellen@verity.com")
    input_fone.set("61986237389")
    text_mensagem.set("Teste Automatizado")
    puts "Selecionando captcha"
    wait_until_captcha_visible
    captcha.click
    puts "Aguardando a seleção manual do captcha"
    sleep(60)
  end

  def btn_enviar
    puts "Selecionando no botão Enviar"
    click_button "Enviar"
  end

  def validando_msg_sucesso
    puts "Validando envio"
    page.assert_text("Mensagem enviada com sucesso!")
  end
end
