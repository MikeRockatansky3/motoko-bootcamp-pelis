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
    
    // Mapa para almacenar puntuaciones (0-10)
    //stable var reviews : TrieMap<Text, [Review]> = TrieMap();
    
    // Función para agregar una nueva película
    public shared func addMovie(data: Types.Movie) : () {
        //Método set para añadir un registro al mapa moviesMap
        Map.set(movies, thash, Nat.toText(data.id), data);
    };

    // Función para eliminar una película
    public shared func delMovie(id: Nat) : () {
        //Método delete para añadir un registro al mapa moviesMap
        //Map.delete(mapa a trabajar, referencia del hash util, key);
        Map.delete(movies, thash, Nat.toText(id));
    };
    /*
    // Función para comprar una película
    public shared(msg) func buyMovie(id: Text) : async ?Movie {
        return movies.get(id);
    };
    */
}

// Hacer stable el hashmap (con mops map) v
// Separar los types en su propio archivo individual v

// Validaciones para eliminar una película
// Función para consultar una película específica
// Función para obtener todos los registros de películas

// Agregar el mapa para almacenar reseñas
// Función para agregar una reseña a una película
// Función para ver el promedio de reseñas de una película (y maybe otra info de la peli)
// ? Autenticación de usuarios


