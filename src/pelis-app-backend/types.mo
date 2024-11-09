import Result "mo:base/Result";

module Types {
    //Definir la estructura del tipo de dato Movie
    public type Movie = {
        id: Nat;
        title: Text;
        year: Nat;
        director: Text;
        price: Float;
    };

    //Definir la estructura para una Review
    type Review = {
        user: Text;
        rating: Nat;
        comment: Text;
    };

    //Definir la estructura del tipo de dato Usuario
    public type User = {
        id: Principal;
        name: Text;
        lastname: Text;
    };

    //Type personalizado para el result. Dos Result, el primero es el módulo Result, y el 2o un type dentro del módulo
    //El tipo espera dos parámetros, uno para cuando todo está bien y otro cuando algo sale mal.
    public type GetMoviesResult = Result.Result<[Types.Movie], Text>;
};