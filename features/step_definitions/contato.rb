Dado("que eu acessei a home page da Verity") do
  @contato = ContatoPage.new
  @contato.load
end

Quando("eu clicar na opção de menu Contato") do
  @contato.clicar_btn_contato
end

Quando("preencher os campos Nome Completo, Empresa, Email, Fone e Mensagem") do
  @contato.dados_contato
end

Quando("clicar no botão Enviar") do
  @contato.btn_enviar
end

Então("o site irá registrar o envio apresentando uma mensagem de que a mensagem foi enviada com sucesso") do
  @contato.validando_msg_sucesso
end
