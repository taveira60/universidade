-module(myqueue).
-export([create/0,enqueue/2,dequeue/1,test/0]).

% create() -> [].

% % enqueue([],Item) -> [Item];
% enqueue(Queue, Item) -> [Item|Queue].

% dequeue([]) -> empty;
% dequeue([E]) -> {[],E};
% dequeue([H|T]) -> 
%     {Q, Item}=dequeue(T),
%     {[H|Q],Item}.

create() -> {[],[]}.

enqueue({In,Out},Item) -> {[Item|In],Out}.

dequeue({[],[]})-> empty;
dequeue({In,[H|T]})->{{In,T},H};
dequeue({In,[]})->dequeue({[],list:reverse(In)}).

test()->
    Q=create(),
    empty=dequeue(Q),
    Q1=enqueue(Q,1),
    Q2=enqueue(Q1,2),
    Q3=enqueue(Q2,3),
    Q4=enqueue(Q3,4),
    Q5=enqueue(Q4,5),
    Q6=enqueue(Q5,6),
    Q7=enqueue(Q6,7),
    {Q8,1} = dequeue(Q7),
    {Q9,2} = dequeue(Q8),
    ok.
