//Importar módulos base
import Text "mo:base/Text";
import Principal "mo:base/Principal";
import Nat "mo:base/Nat";
//Importar módulos de Mops
import Map "mo:map/Map";
import { thash } "mo:map/Map";
//Importar el módulo types (Del archivo types.mo)
import Types "types";

actor PeliStore {
    
    // Mapa para almacenar películas
    var movies = Map.new<Text, Types.Movie>();

    // Mapa para almacenar reseñas
    var reviews = Map.new<Text, Types.Review>();

    //Función para agregar una reseña a una película
    public shared func reviewMovie(data: Types.Review) : () {
        //Método set para añadir un registro al mapa reviews
        //func set<K, V>(map: Map<K, V>, hashUtils: HashUtils<K>, key: K, value: V): ()
        Map.set(reviews, thash, Nat.toText(data.id_review), data);
    };

    //Función para ver las reseñas
    public shared query ({caller}) func getReviews(id: Nat) : async Types.GetReviewsResult {

        if(Principal.isAnonymous(caller)) {
            //return []; //Si el usuario no está utenticado regresa un array vacío
            return #err("Debes estar autenticado para ver las reseñas"); //Regresar un mensaje en vez de un array vacío
        };

        //func has<K, V>(map: Map<K, V>, hashUtils: HashUtils<K>, key: K): Bool
        var exists = Map.has(movies, thash, Nat.toText(id));

        if(exists == false) {
            return #err("La película con el ID " # Nat.toText(id) # " no existe.");
        };

        var reviewsArray = Map.toArray(reviews): [(Text, Types.Review)];
        return #ok(reviewsArray);

    };


    // Función para comprar una película
    public shared query ({caller}) func buyMovie(id: Nat) : async Types.BuyMovieResult {
        if(Principal.isAnonymous(caller)) {
            //Si el usuario no está utenticado regresa un mensaje de texto
            return #err("Debes estar autenticado para ver los usuarios");
        };

        //Ahora validamos que la película exista con la funcion has
        //func has<K, V>(map: Map<K, V>, hashUtils: HashUtils<K>, key: K): Bool
        var exists = Map.has(movies, thash, Nat.toText(id));

        if(exists == false) {
            //Si la película no existe decirselo al usuario
            return #err("La película con el ID " # Nat.toText(id) # " no existe.");
        };

        //Si se cumplieron las validaciones anteriores, se procede con la compra
        // func get<K, V>(map: Map<K, V>, hashUtils: HashUtils<K>, key: K): ?V
        return #ok(Map.get(movies, thash, Nat.toText(id)): ?Types.Movie);
    };

    // Función para obtener todas las películas
    public shared query func getMovies() : async [(Text, Types.Movie)] {
        var moviesArray = Map.toArray(movies): [(Text, Types.Movie)];
        return moviesArray;
    };
    
    // Función para agregar una nueva película
    public shared func addMovie(data: Types.Movie) : () {
        //Método set para añadir un registro al mapa movies
        //func set<K, V>(map: Map<K, V>, hashUtils: HashUtils<K>, key: K, value: V): ()
        Map.set(movies, thash, Nat.toText(data.id), data);
        
    };

    // Función para eliminar una película
    public shared func delMovie(id: Nat) : () {
        //Método delete para añadir un registro al mapa movies
        //Map.delete(mapa a trabajar, referencia del hash util, key);
        Map.delete(movies, thash, Nat.toText(id));
    };
    
}

// Hacer stable el hashmap (con mops map) ✓
// Separar los types en su propio archivo individual ✓

// Función para consultar una película específica ✓
// Función para obtener todos los registros de películas ✓

// Agregar el mapa para almacenar reseñas ✓
// Función para agregar una reseña a una película ✓
// Función para ver el promedio de reseñas de una película
// Tal vez integrar autenticación de usuarios?