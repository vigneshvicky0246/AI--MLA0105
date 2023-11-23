% Facts: gender and parent relationships
gender(john, male).
gender(jane, female).
gender(bob, male).
gender(lisa, female).

parent(john, sarah).
parent(jane, sarah).
parent(bob, mike).
parent(lisa, mike).

% Rules: Define parent based on gender and having a child
parent(X, Y) :- gender(X, male), parent(X, Y).
parent(X, Y) :- gender(X, female), parent(X, Y).

% Query examples:
% 1. Is John a parent?
%    Query: parent(john, _).
%    Response: true (because John is a parent of Sarah)

% 2. Who are the parents of Mike?
%    Query: parent(X, mike).
%    Response: X = bob, X = lisa (because both Bob and Lisa are parents of Mike)
