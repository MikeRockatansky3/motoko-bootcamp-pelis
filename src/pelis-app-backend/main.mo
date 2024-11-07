import TrieMap "mo:base/TrieMap";
import HashMap "mo:base/HashMap";
import Text "mo:base/Text";

actor MovieStore {
    // Estructura para una película
    type Movie = {
        id: Text;
        title: Text;
        description: Text;
        price: Nat;
    };
    
    // Estructura para una reseña
    type Review = {
        user: Text;
        rating: Nat;
        comment: Text;
    };
    
    // Mapa para almacenar películas
    var movies = HashMap.HashMap<Text, Movie>(5, Text.equal, Text.hash);
    
    // Mapa para almacenar puntuaciones (0-10)
    //stable var reviews : TrieMap<Text, [Review]> = TrieMap();
    
    // Función para agregar una nueva película
    public shared(msg) func addMovie(id: Text, title: Text, description: Text, price: Nat) : async () {
        let movie : Movie = {
            id = id;
            title = title;
            description = description;
            price = price;
        };
        movies.put(id, movie);
    };
    
    // Función para comprar una película
    public shared(msg) func buyMovie(id: Text) : async ?Movie {
        return movies.get(id);
    };
    /*
    // Función para agregar una reseña a una película
    public shared(msg) func addReview(id: Text, user: Text, rating: Nat, comment: Text) : async () {
        let review : Review = {
            user = user;
            rating = rating;
            comment = comment;
        };
        if (reviews.containsKey(id)) {
            reviews.get(id).add(review);
        } else {
            reviews.put(id, [review]);
        }
    };
    
    
    // Función para obtener todas las reseñas de una película
    public shared query func getReviews(id: Text) : async ?[Review] {
        return reviews.get(id);
    };
    */

    //Función para mostrar el promedio de reseñas de una película
}

