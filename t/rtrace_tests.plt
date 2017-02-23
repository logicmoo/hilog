
:- use_module(library(must_trace)).
:- use_module(library(bugger)).


:- set_prolog_flag(runtime_saftey,3).
:- set_prolog_flag(runtime_debug,2).
:- set_prolog_flag(runtime_speed,1).
:- set_prolog_flag(runtime_space,1).
:- set_prolog_flag(compilation_speed,0).

:- set_prolog_flag(must_type,keep_going).

test(0):- must(\+ fail).

test(1):- must_once(fail).

test(2):- must_det(fail).

test(2):- sanity(fail).

% quietly(:GOAL) - if tracing, temporaily no_trace/1
test(2):- rtrace(( trace_me, quietly(dont_trace_me))).

all_tests:- forall(test(_),true).

:- listing(test(_)).
