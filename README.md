# `pelis-app`

Este es mi proyecto en Motoko `PeliStore`, un canister de compra y reseña de películas, el cual integra hashMaps estables con la librería `map` de Mops, y autenticación de usuarios, con internet-identity.

Dentro de el canister hay varias funcionalidades, como añadir una nueva película, borrar una película, obtener los registros de todas las películas, y comprar una película mediante su ID, esta última función tiene ciertas validaciones, que te impiden comprar una película si no estás autenticado como usuario y si la película no existe.

Para las reseñas, se puede agregar una reseña, para lo cual se específica el id de la peli a reseñar, y obtener las reseñas.

## Futuras líneas de desarrollo
- Función para ver el promedio de reseñas de una película, filtrando las reseñas con el id de la película.
- Validaciones al agregar una peli o reseña, que no se pueda crear un registro con id repetido, porque sobreescribe el registro anterior.
- Función de filtrado de películas por director o año.

## Iniciar el proyecto

Para desplegar el proyecto en la computadora del evaluador:

Hacer un git clone

```bash
git clone https://github.com/MikeRockatansky3/motoko-bootcamp-pelis.git
```

Abrir la carpeta del proyecto

```bash
cd pelis-app
```

Levantar la réplica de fondo

```bash
dfx start --background --clean
```

Desplegar los canister en Candid UI

```bash
dfx deploy
```

