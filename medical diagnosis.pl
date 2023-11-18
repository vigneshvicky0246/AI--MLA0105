symptom(fever).
symptom(cough).
symptom(headache).
symptom(sore_throat).
symptom(fatigue).

disease(influenza, [fever, cough, sore_throat, fatigue]).
disease(cold, [fever, headache, sore_throat]).
disease(measles, [fever, cough, sore_throat, rash]).

diagnose(Symptoms, Disease) :-
    disease(Disease, SymptomsList),
    subset(SymptomsList, Symptoms).

subset([], _).
subset([Head|Tail], List) :-
    member(Head, List),
    subset(Tail, List).
