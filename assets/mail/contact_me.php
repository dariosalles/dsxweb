<?php
	require_once('conexao.php');
    $assunto = $_REQUEST["assunto"];
    $nome = $_REQUEST["name"];
    $email = $_REQUEST["email"];
    $telefone = $_REQUEST["telefone"];
    $mensagem = $_REQUEST["message"];
    $assunto = "Nova mensagem - www.dsxweb.com.br";

    // cadastra a mensagem no bd
    $data = date('Y-m-d');
    $vInsert = "INSERT into contato(nome,email,telefone,mensagem,data) VALUES('$nome','$email','$telefone','$mensagem','$data')";
    mysqli_query($conn,  $vInsert);

    $quebra = "<br>";
    $corpo = "<p><img border=0 src=http://www.dsxweb.com.br/imagens/logo_novo-www.png alt=DSXWEB/><br /><br>";
    $corpo = $corpo."<blockquote><font face=Calibri, Verdana>";
    $corpo = $corpo."Nome: ".$nome.$quebra;
    $corpo = $corpo."E-mail: ".$email.$quebra;
    $corpo = $corpo."Telefone: ".$telefone.$quebra;
    $corpo = $corpo."Mensagem: ".$mensagem;
    $corpo = $corpo."</font></blockquote></p>";

    try {
        require("../../PHPMailer/src/PHPMailer.php");
        require("../../PHPMailer/src/SMTP.php");
        require("../../PHPMailer/src/Exception.php");
        require('../../env.php');

        $mail = new PHPMailer\PHPMailer\PHPMailer();
        $mail->IsSMTP(); 
        $mail->CharSet="UTF-8";
        $mail->Host = getEnv::HOST_EMAIL;
        $mail->SMTPDebug = 0; 
        $mail->Port = 465 ; //465 or 587

        $mail->SMTPSecure = 'ssl';  
        $mail->SMTPAuth = true; 
        $mail->IsHTML(true);

        //Authentication
        $mail->Username = getEnv::EMAIL;
        $mail->Password = getEnv::EMAIL_PASSWORD;

        //Set Params
        $mail->SetFrom($email, $nome);
        $mail->AddAddress("contato@dsxweb.com.br");
        $mail->AddCC("dariosalles@gmail.com");

        $mail->Subject = $assunto;
        $mail->Body = $corpo;

        if($mail->send()) {
            return true;
        } else {
            return false;
        }
    } catch (Exception $e) {
        return false;
	}

?>
