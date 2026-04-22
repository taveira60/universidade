-module(loginchat).
-export([start/1, stop/1]).

start(Port) ->
    login_manager:start(),
    spawn(fun() -> server(Port) end).

stop(Server) ->
    Server ! stop,
    login_manager:stop().

%%%%%%%%%%%%%%%ex3


getRoom(RoomManager, Name)->
    RoomManager ! {get,Name,self()},
    receive{RoomManager,RoomPid} -> RoomPid end.

room_manager(Map) ->
    receive
        {get,Name,From}->
    
    end.

%%%%%%%%%%%55

server(Port) ->
    {ok, LSock} = gen_tcp:listen(Port, [binary, {packet, line}, {reuseaddr, true}]),
    RoomManager = spawn(fun() -> room_manager(#{}) end),
    spawn(fun() -> acceptor(LSock, RoomManager) end),
    receive
        stop -> ok
    end.

acceptor(LSock, Room) ->
    {ok, Sock} = gen_tcp:accept(LSock),
    spawn(fun() -> acceptor(LSock, Room) end),
    % ALTERAÇÃO 1: Começar no estado "Não Autenticado"
    user_not_auth(Sock, Room).

room(RoomName,Pids) ->
    receive
        {enter, Pid} ->
            io:format("user entered~n", []),
            room(RoomName,[Pid | Pids]);
        {line, User, Data} ->
            io:format("received ~p: ~p~n", [User, Data]),
            [Pid ! {line,RoomName,User,Data} || Pid <- Pids],
            room(RoomName,Pids);
        {leave, Pid} ->
            io:format("user left~n", []),
            room(RoomName,Pids -- [Pid])
    end.

user_not_auth(Sock, RoomManager) ->
    receive
        % {line, Data} ->
        %   gen_tcp:send(Sock, Data),
        %   user(Sock, Room);
        {tcp, _, Data} ->
            case string:split(Data, " ", all) of
                ["/create", User, Pass] ->
                    case login_manager:create_account(user, pass) of
                        ok ->
                            Room = getRoom(RoomManager, "principal"),
                            login_manager:login(user, pass),
                            Room ! {enter, self()},
                            user_auth(Sock, "principal", Room, User, RoomManager);
                        _ ->
                            gen_tcp:send(stock, "create account error"),
                            user_not_auth(sock, room)
                    end;
                ["/login", User, Pass] ->
                    case login_manager:login_account(user, pass) of
                        ok ->
                            login_manager:login(user, pass),
                            RoomManager ! {enter, self()},
                            user_auth(Sock, "principal" ,RoomPid, User,RoomManager);
                        _ ->
                            gen_tcp:send(stock, "login account error"),
                            user_not_auth(sock, room)
                    end;
                _ ->
                    gen_tcp:send(Sock, "Need to create user or authenticate"),
                    user_not_auth(Sock, RoomManager)
            end;
        {tcp_closed, _} ->
            RoomManager ! {leave, self()};
        {tcp_error, _, _} ->
            RoomManager ! {leave, self()}
    end.

user_auth(Sock, RoomName, RoomPid, User, RoomManager) ->
    receive
        {line, MsgRoomName,MsgUser,Data} ->
            gen_tcp:send(Sock, [MsgRoomName,":",MsgUser, ": ", Data]),
            user_auth(Sock, RoomName,RoomPid, User,RoomManager);
        {tcp, _, Data} ->
            case string:split(Data," ",all) of
                ["/room", NewRoomName]->
                    NewRoomPid= getRoom(RoomManager,NewRoomName),
                    RoomPid ! {leave,self()},
                    NewRoomPid ! {enter,self()},
                    user_auth(sock,NewRoomName,NewRoomPid,User,RoomManager);
                _->
            RoomManager ! {line, User, Data},
            user_auth(Sock, NewRoomName,NewRoomPid,User, RoomManager)
            end;
        {tcp_closed, _} ->
            Room ! {leave, self()};
        {tcp_error, _, _} ->
            Room ! {leave, self()}
    end.
