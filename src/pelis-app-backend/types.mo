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
    public type Review = {
        id_review: Nat;
        id_movie: Nat;
        stars: Nat;
    };

    //Definir la estructura del tipo de dato Usuario
    public type User = {
        id: Principal;
        name: Text;
        lastname: Text;
    };

    //Type personalizado para el result. Dos Result, el primero es el módulo Result, y el 2o un type dentro del módulo
    //Si una película existe, devolver el promedio de sus stars, sino devolver un mensaje de texto al usuario.
    public type BuyMovieResult = Result.Result< ?Movie, Text>;
    public type GetReviewsResult = Result.Result<[(Text, Review)], Text>;
};