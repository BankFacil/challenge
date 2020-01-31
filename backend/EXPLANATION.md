## Desafio para Backend Software Engineer

### Estrategia:
- He incluido una librería de pruebas para añadir las reglas de negocio ayudandome de un desarrollo guidado por pruebas.
- He empezado haciendo un test para controlar el ejemplo de compra de libro sugerido.
- A la hora de acoger las reglas de negocio he pensado en seguir un patron null object para afrontar la kata.
- He ido implementando las reglas de negocio en orden mediante TDD, sin refactorizar, quería acabar todos los test para plantearme mejoras de diseño.
- Cuando todas las reglas de negocio estaban implementadas, me he centrado en refactorizar.
- A nivel de semantica en el codigo real lo he visto bien.

### Preocupaciones:

- El código podría ser mas legible.
- Los objetos tienen sus atributos demasiado expuestos.
- La clase Result inicializa a Membership todas las veces que se crea, habría que activarlo sólo cuando fuera necesario.
- No me siento cómoda con la estrategia en la que he puesto el descuento, le daría otra vuelta.
- La variable total_price sólo se usa en las pruebas. La factura debería de tener conocimiento de ella.
- Utilizo banderas para saber si se las acciones se han ejecutado, no se si es la mejor manera.


### Siguientes pasos:
- Preguntar si se incluye la variable "total_price" en la factura junto con el descuento.
- Sacar las clases por ficheros
- Refactorizar la clase Result.
  - Sacar a objeto shipping para delegar responsabilidades.
  - Sacar a objeto notification para delegar responsabilidades.
- Refactorizar la clase Payment, lo sacaría a un objeto que se responsabilizara de devolver el comportamiento que toque.
- Revisar las clases y ajustar los accesos a los métodos.

