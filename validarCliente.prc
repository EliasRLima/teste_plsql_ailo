create or replace procedure validarCliente(p_cliente in cliente.typ_tab_cliente) is

  e_validacao EXCEPTION;
begin
  if p_cliente(1).tipopessoa = cliente.c_tipoPessoaFisica then
    if p_cliente(1).nomecliente is null then
      dbms_output.put_line('O nome de pessoas fisicas � obrigatorio.');
      raise e_validacao;
    elsif p_cliente(1).datanascimento is null then
      dbms_output.put_line('A data de nascimento de pessoas fisicas � obrigatoria.');
      raise e_validacao;
    elsif p_cliente(1).cpfcnpj is null then
      dbms_output.put_line('O CPF � obrigatorio para pessoas fisicas.');
      raise e_validacao;
    end if;
  elsif p_cliente(1).tipopessoa = cliente.c_tipoPessoaJuridica then
    if p_cliente(1).nomecliente is null then
      dbms_output.put_line('O nome de pessoas juridicas � obrigatorio.');
      raise e_validacao;
    elsif p_cliente(1).faturamentoanual is null then
      dbms_output.put_line('O faturamento anual de pessoas juridicas � obrigatorio.');
      raise e_validacao;
    elsif p_cliente(1).cpfcnpj is null then
      dbms_output.put_line('O CNPJ � obrigatorio para pessoas juridicas.');
      raise e_validacao;
    end if;
  else
    dbms_output.put_line('Tipo de pessoa nao reconhecido.');
    raise e_validacao;
  end if;
end ;
/
