-module(ex3).
-exports([create/0, participa/1, adivinha/2]).

create() ->
    spawn(fun()->jogo([])end).

participa(Jogo)->
    Jogo ! {participa,self()},
    receive {partida,Partida}->Partida end .

adivinha(Partida,N)->
    Partida ! {adivinha,N,self()},
    receive {result,Res} -> Res end.

jogo(Jogadores) when lenght(Jogadores) =:= 4-> 
    Partida = spawn(fun()-> init_partida() end),
    [Jogador ! {participa,Partida} || Jogador <- Jogadores],
    jogo([]);

jogo(Jogadores) -> 
    receive
        {participa,Jogador} ->
            jogo([Jogador|Jogadores])
    end.

init_partida() -> 
    Self=self(),
    spawn(fun()-> receive after 60000 -> ok end, Self ! timeout end),
    Numero = random(1, 100),
    partida(Numero, false, false,0).

partida(Numero, Timeout, Ganhou, Tentativas)->
    receive
        {adivinha,N,From}->
            Res =
            if
                Ganhou->"Perdeu";
                Timeout->"Tempo";
                Tentativas >= 100 -> "Tentativas";
                Numero < N -> "MAIOR";
                Numero > N -> "Menor";
                Numero =:= N ->"Ganhou";
            end,
            Jogador ! {result, Res},
            partida(Numero,Timeout,Ganhou orelse Numero =:= N,Tentativas + 1)
        timeout->
            partida(Numero,true,Ganhou,Tentativas)
    end.