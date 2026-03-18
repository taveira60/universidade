clear,clc,close all;

syms w1 w2
F=100*(w2-w1^2)^2+(1-w1)^2;
grad =gradient(F,[w1 w2]);