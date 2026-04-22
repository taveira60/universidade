# ficha8

use entrega_comida;

#pergunta 1

select nome, contacto from Estafeta order by nome asc;

#pergunta 2

select designacao, preco_dose from Prato where tipo="CARNE";

# pergunta 3

select * from Cliente where cod_postal LIKE '47%';

#pergunta 4

select * from Pedido where preco between '10.0' and '50.0' order by preco asc limit 3;

#pergunta 5

select distinct idcliente, nome from Cliente C where exists (select idcliente from Pedido P where data_pedido>'2024-01-01'and P.idCliente=C.idCliente);  

#pergunta 6

select P.designacao,IP.dose,IP.preco from Prato P  left join Item_pedido IP on P.idPrato=IP.idPrato where P.tipo in ('CARNE','Vegano');

#pergunta 7

SELECT C.NOME, P.DATA_PEDIDO, E.NOME FROM Cliente C INNER JOIN Pedido P ON C .IDCLIENTE=P.IDCLIENTE INNER JOIN Estafeta E ON P.IDESTAFETA=E.IDESTAFETA
WHERE P.IDESTAFETA IS NOT NULL AND YEAR(P.DATA_PEDIDO)='2025';

#pergunta 8
select count(idpedido) as total_pedidos from Pedido;

#pergunta 9
select round(avg(preco_dose),2) as preco_medio,Max(preco_dose) as preco_maximo from Prato;

#pergunta 10
select idcliente,count(idcliente) as numero_pedidos from Pedido group by idcliente having numero_pedidos>1 ;

#pergunta 11

select idestafeta,sum(preco) from Pedido group by idestafeta order by sum(preco) desc;
