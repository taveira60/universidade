-module(loginchat).
-export([start/1, stop/1]).

start(Port) ->
    login_manager:start(),
    spawn(fun() -> server(Port) end).

stop(Server) ->
    Server ! stop,
    login_manager:stop().

server(Port) ->
    {ok, LSock} = gen_tcp:listen(Port, [binary, {packet, line}, {reuseaddr, true}]),
    Room = spawn(fun() -> room([]) end),
    spawn(fun() -> acceptor(LSock, Room) end),
    receive
        stop -> ok
    end.

acceptor(LSock, Room) ->
    {ok, Sock} = gen_tcp:accept(LSock),
    spawn(fun() -> acceptor(LSock, Room) end),
    % ALTERAÇÃO 1: Começar no estado "Não Autenticado"
    user_not_auth(Sock, Room).

room(Pids) ->
    receive
        {enter, Pid} ->
            io:format("user entered~n", []),
            room([Pid | Pids]);
        {line, User, Data} = Msg ->
            io:format("received ~p: ~p~n", [User, Data]),
            [Pid ! Msg || Pid <- Pids],
            room(Pids);
        {leave, Pid} ->
            io:format("user left~n", []),
            room(Pids -- [Pid])
    end.

user_not_auth(Sock, Room) ->
    receive
        % {line, Data} ->
        %   gen_tcp:send(Sock, Data),
        %   user(Sock, Room);
        {tcp, _, Data} ->
            case string:split(Data, " ", all) of
                ["/create", User, Pass] ->
                    case login_manager:create_account(user, pass) of
                        ok ->
                            login_manager:login(user, pass),
                            Room ! {enter, self()},
                            user_auth(Sock, Room, User);
                        _ ->
                            gen_tcp:send(stock, "create account error"),
                            user_not_auth(sock, room)
                    end;
                ["/login", User, Pass] ->
                    case login_manager:login_account(user, pass) of
                        ok ->
                            login_manager:login(user, pass),
                            Room ! {enter, self()},
                            user_auth(Sock, Room, User);
                        _ ->
                            gen_tcp:send(stock, "login account error"),
                            user_not_auth(sock, room)
                    end;
                _ ->
                    gen_tcp:send(Sock, "Need to create user or authenticate"),
                    user_not_auth(Sock, Room)
            end;
        {tcp_closed, _} ->
            Room ! {leave, self()};
        {tcp_error, _, _} ->
            Room ! {leave, self()}
    end.

user_auth(Sock, Room, User) ->
    receive
        {line, Data} ->
            gen_tcp:send(Sock, [User, ": ", Data]),
            user_auth(Sock, Room, User);
        {tcp, _, Data} ->
            Room ! {line, User, Data},
            user_auth(Sock, Room, User);
        {tcp_closed, _} ->
            Room ! {leave, self()};
        {tcp_error, _, _} ->
            Room ! {leave, self()}
    end.
