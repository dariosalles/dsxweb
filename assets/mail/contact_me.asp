<%

response.buffer = true
assunto = request("assunto")
assunto = request.form("assunto")

nome = request.form("name")
'nome = "Dario"

email = request.form("email")
'email = "dariosalles@gmail.com"

telefone = request.form("telefone")

mensagem = request.form("message")
'mensagem = "Teste 05"

'Assunto = "Nova mensagem - www.dsxweb.com"
'enviarviaform = request("enviarviaform")

'if enviarviaform <> "Sim" then

'return false

'else

'if nome = "" or email = "" or mensagem = "" then %>

<!--<script>
alert('Preencha todos os campos obrigatórios');
javascript:history.back();
</script>-->

<% 'end if 

quebra = "<br>"
corpo = "<p><img border=0 src=http://www.dsxweb.com/imagens/logo_novo.png alt=DSXWEB/><br /><br>"
corpo = corpo & "<blockquote><font face=Calibri, Verdana>"
corpo = corpo & "Nome: " & nome & quebra 
corpo = corpo & "E-mail: " & email & quebra 
corpo = corpo & "Assunto: " & assunto & quebra 
corpo = corpo & "Mensagem: " & mensagem
corpo = corpo & "</font></blockquote></p>"

response.write corpo
'response.end

Set Mail = Server.CreateObject("Persits.MailSender") 
Mail.IsHTML = True 
Mail.Host = "smtp.dsxweb.com" 
Mail.Username = "mail@dsxweb.com" 
Mail.Password = "uov83@dsxweb" 
Mail.From = email
Mail.FromName = nome
Mail.AddAddress "dario@dsxweb.com" ' destinatario
Mail.AddCC "mail@dsxweb.com"
Mail.AddCC "dariosalles@gmail.com"
Mail.Subject = assunto 
Mail.Body =  "" & corpo & ""

On Error Resume Next 
Mail.Send 
'response.write "Enviado com sucesso"

return true
'response.redirect("contato.asp#emailenviadosucesso")


'end if
%>