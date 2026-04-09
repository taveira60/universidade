-module(ex1).
-export([create_account/2, close_account/2, login/2, logout/1, online/0]).
% funções de interface

start() -> 
    Pid = spawn(fun() -> loop(#{}) end),
    register(?MODULE, Pid).

rpc(Request)->
    ?MODULE ! {Request,self()},
    receive{?MODULE,Res}-> Res end.

create_account(Username, Passwd) -> rpc({create_account,Username,Passwd}).

close_account(Username, Passwd) -> rpc({close_account,Username,Passwd}).

login(Username, Passwd) -> rpc({login,Username,Passwd}).

logout(Username) -> rpc({logout,Username}).

online() -> rpc({online})
.

% processo de server 
loop(Map) -> 
    receive
        {create_account,Username,Passwd,From} -> 
        case maps:fin(Username, Map) of
            error->
                From ! {?MODULE,ok},
                loop(Map1=maps:put(Username,{Passwd,true},Map));
            {ok,_}->
                From ! {?MODULE,user_exists},
                loop(Map)
            end;
        {close_account,Username,Passwd,From} ->
        case maps:fin(Username, Map) of
            error->
                From ! {?MODULE, invalid},
                loop(Map);
            {ok,{Passwd,_}}->
                From ! {?MODULE,ok},
                loop(maps:remove(Username,Map));
            {ok,_}->
                From ! {?MODULE,invalid},
                loop(Map)
            end;
        {login,Username,Passwd,From} ->
        case maps:fin(Username, Map) of
            error->
                From ! {?MODULE, invalid},
                loop(Map);
            {ok,{Passwd,_}}->
                From ! {?MODULE,ok},
                loop(maps:put(Username,{Passwd,true},Map));
            {ok,_}->
                From ! {?MODULE,invalid},
                loop(Map)
            end;
            {logout,Username,Passwd,From} ->
        case maps:fin(Username, Map) of
            error->
                From ! {?MODULE, invalid},
                loop(Map);
            {ok,{Passwd,_}}->
                From ! {?MODULE,ok},
                loop(maps:put(Username,{Passwd,false},Map));
            {ok,_}->
                From ! {?MODULE,invalid},
                loop(Map)
            end
end.