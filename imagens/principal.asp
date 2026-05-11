<!--#include file="logado.asp"-->
<!--#include file="conexao.asp"-->
<HTML>
<HEAD>
<TITLE>FUTEBOL VIRTUAL  - Administra&ccedil;&atilde;o</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">
<link href="padrao.css" rel="stylesheet" type="text/css">

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_goToURL() { //v3.0
  var i, args=MM_goToURL.arguments; document.MM_returnValue = false;
  for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"?ano="+document.form1.cboAno.value+"'");
}
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
<style type="text/css">
<!--
.style1 {
	font-size: 18px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #006600;
}
-->
</style>
</HEAD>
<BODY BGCOLOR=#FFFFFF link="#006600" vlink="#0033CC" alink="#FF0000" LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>
<!-- ImageReady Slices (layout.psd) -->
<TABLE WIDTH=100% height="100%" BORDER=0 CELLPADDING=0 CELLSPACING=0>
  <TR> 
    <TD COLSPAN=3><span class="titulo"><a href="index.asp" target="_blank"><img src="../imagens/top.jpg" width="500" height="104" border="0"></a></span></TD>
  </TR>
  <TR> 
    <TD width="16" ROWSPAN=2 valign="top" bgcolor="#FAC007">&nbsp; </TD>
    <TD width="591" height="27" align="left" valign="top">&nbsp; </TD>
    <TD width="163" height="285" ROWSPAN=2 valign="top" bgcolor="#FAC007"> 
      <table width="95%" border="0" align="right">
        <tr>
          <td valign="top"><p><font size="1" class="subtitulo"><strong><font color="#003300" face="Verdana, Arial, Helvetica, sans-serif">- 
              Campeonatos</font></strong></font></p>
            <p><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Ano: </font>			  
			<form name="form2" id="form2">
			  <select name="jumpMenu2" id="jumpMenu2" onChange="MM_jumpMenu('parent',this,0)">
			   <%
				ano= request.QueryString("ano")
				vSelectCamp = "SELECT ano,data FROM campeonatos GROUP BY ano ORDER BY data DESC"
				set rsAno = conexao.execute(vSelectCamp)
				response.Write("<option value='principal.asp?ano=" & ano & "'>" & ano & "</option>")
				while not rsAno.eof
					response.Write("<option value='principal.asp?ano=" & rsAno("ano") & "'>" & rsAno("ano") & "</option>")
					rsAno.movenext
				wend
				%>	
		      </select>
		    </form>
			<p><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Campeonatos: </font>
            <p>
              <% 
			'vSelectCamp = "SELECT * from campeonatos where ativado = 'S'"
			vSelectCamp = "SELECT * from campeonatos where ano='" & ano & "' order by ano desc, campeonato"
			set rsListaCamp = conexao.execute(vSelectCamp)

			if not rsListaCamp.eof then
			'lista os campeonatos
			while not rsListaCamp.eof %>
              <font face="Verdana, Arial, Helvetica, sans-serif" size="1"><a href="admcamp.asp?idcampeonato=<%= rsListaCamp("idcampeonato")%>" target="admcentroliga"><% response.Write(rsListaCamp("campeonato")) %></a> - <a target="_blank" href="index.asp?idcampeonato=<%=rsListaCamp("idcampeonato")%>">Acessar</a></font><br>
              <% rsListaCamp.movenext
			wend 
			end if
			%>
            </p>
            <p>&nbsp;</p>
            <p><font size="1"><strong><font face="Verdana, Arial, Helvetica, sans-serif"><br>
              </font></strong></font></p>
          </td>
        </tr>
      </table>
    </TD>
  </TR>
  <TR> 
    <TD width="591" align="left" valign="top"> <table width="100%"  border="0" cellspacing="0">
      <tr>
        <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="adm-campeonato.asp" target="admcentroliga"><strong><img src="../imagens/but_addcamp.jpg" width="300" height="62" border="0"></strong></a></font></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
      <p align="center">
        <iframe align="top" scrolling="yes" frameborder="0" marginwidth="0" marginheight="0" name="admcentroliga" width="95%" height="500" src="inicio.htm"></iframe>
    </p></TD>

  </TR>

</TABLE>

<!-- End ImageReady Slices -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">

  <tr> 

    <td height="25">&nbsp;</td>

  </tr>

</table>

</BODY>

</HTML>