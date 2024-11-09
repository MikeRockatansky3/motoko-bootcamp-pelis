//Importar módulos base
import Text "mo:base/Text";
import _Principal "mo:base/Principal";
import Nat "mo:base/Nat";
//Importar módulos de Mops
import Map "mo:map/Map";
import { thash } "mo:map/Map";
//Importar el módulo types (Del archivo types.mo)
import Types "types";

actor PeliStore {
    
    // Mapa para almacenar películas
    var movies = Map.new<Text, Types.Movie>();

    // Función para verificar si una película existe
    public shared query func checkMovie(id: Nat) : async Bool {
        //func has<K, V>(map: Map<K, V>, hashUtils: HashUtils<K>, key: K): Bool
        return Map.has(movies, thash, Nat.toText(id));
    };

    // Función para comprar una película
    public shared query func buyMovie(id: Nat) : async ?Types.Movie {
        // func get<K, V>(map: Map<K, V>, hashUtils: HashUtils<K>, key: K): ?V
        return Map.get(movies, thash, Nat.toText(id)): ?Types.Movie;
    };

    // Función para obtener todas las películas
    public shared query func getMovies() : async [(Text, Types.Movie)] {
        var moviesArray = Map.toArray(movies): [(Text, Types.Movie)];
        return moviesArray;
    };
    
    // Mapa para almacenar puntuaciones (0-10)
    //stable var reviews : TrieMap<Text, [Review]> = TrieMap();
    
    // Función para agregar una nueva película
    public shared func addMovie(data: Types.Movie) : () {
        //Método set para añadir un registro al mapa moviesMap
        //func set<K, V>(map: Map<K, V>, hashUtils: HashUtils<K>, key: K, value: V): ()
        Map.set(movies, thash, Nat.toText(data.id), data);
    };

    // Función para eliminar una película
    public shared func delMovie(id: Nat) : () {
        //Método delete para añadir un registro al mapa moviesMap
        //Map.delete(mapa a trabajar, referencia del hash util, key);
        Map.delete(movies, thash, Nat.toText(id));
    };
    
}

// Hacer stable el hashmap (con mops map) ✓
// Separar los types en su propio archivo individual ✓

// Función para consultar una película específica ✓
// Función para obtener todos los registros de películas ✓

// Agregar el mapa para almacenar reseñas
// Función para agregar una reseña a una película
// Función para ver el promedio de reseñas de una película
// Tal vez integrar autenticación de usuarios?