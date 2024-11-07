import Result "mo:base/Result";

module Types {
    //Definir la estructura del tipo de dato Movie
    public type Movie = {
        id: Principal;
        title: Text;
        description: Text;
        cost: Nat;
    };

    //Definir la estructura para una Review
    type Review = {
        user: Text;
        rating: Nat;
    };

    //Type personalizado para el result. Dos Result, el primero es el módulo Result, y el 2o un type dentro del módulo
    //El tipo espera dos parámetros, uno para cuando todo está bien y otro cuando algo sale mal.
    type GetMoviesResult = Result.Result<[Types.Movie], Text>;
};