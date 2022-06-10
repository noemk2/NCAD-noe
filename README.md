# NEAR Certified AURORA Developer (DemoDay)


--- IMAGEN --- 

#### Objetivos del NCAD (NEAR Certified AURORA Developer)
 Este curso es una oportunidad para que los desarrolladores dentro del ecosistema de NEAR obtengan un certificado al desarrollar contratos inteligentes en el lenguaje Solidity para la red de AURORA.

#### Actividades propuestas para NCAD
- Día 0: Recursos para antes de comenzar
- Día 1: Introducción a la red AURORA y al desarrollo de contratos inteligentes en  Solidity
- Día 2: Interacción con Contratos Inteligentes en Remix 
- Día 3: Despliegue de un Contrato Inteligente en Aurora con Remix 
- Día 4: Rainbow Bridge y Conocimientos Avanzados en Solidity
- Día 5: DEMO DAY

</br>
</br>

## 👨‍💻  Actividades realizadas por @noemk2:
-- posiblemente borrar atividades realizadas --  </br>
--- especifica mas los contratos que se utilizan --- </br>
-- un loom --

## Contratos utilizado en este demo (testnet):
- calc.noemk3.testnet (contrato para el cross-contract-callback)
- productos.mue.testnet (contrato principal (lib.rs): simple crud para agregar y eliminar productos )

## Uso del nodo de thegraph en near testnet
- https://thegraph.com/hosted-service/subgraph/noemk2/simi (nodo live en thegraph)
- ./Simi/src/mapping.ts (implementacion del subgraph) 

</br>

## USO DEL CONTRATO productos.mue.testnet:
-- API del contrato --

ID= productos.mue.testnet
</br>


## Inicializar contrato:
```sh
    near call productos.mue.testnet new '{"owner_id": "mue.testnet"}' --accountId $YOUR_ACCOUNT.testnet
```

## Obtener producto
```sh
    near view productos.mue.testnet get_products '{"address":"noemk3.testnet"}'
    near view productos.mue.testnet get_products '{"address":"nie.testnet"}'
    near view productos.mue.testnet  get_products '{"address":"mue.testnet"}'
```

## Guardar producto

```sh
  near call productos.mue.testnet set_products '{"address": "noemk3.testnet", "name": "phone 5", "price": 520, "stock": 50,"cid": "QmUWe3CW6NoFimZ34xWCKdzrveCD5zqExTAUeFzJ6nbDYp" }' --accountId mue.testnet


near call productos.mue.testnet set_products '{"address": "mue.testnet", "name": "phone 1", "price": 10, "stock": 10,"cid": "Qmb7VQPf7KFnXSQed5LWWQoCzmqvsQQoaEjd98wGweppvE" }' --accountId mue.testnet


near call productos.mue.testnet set_products '{"address": "nie.testnet", "name": "phone 4", "price": 40, "stock": 40,"cid": "Qmb7VQPf7KFnXSQed5LWWQoCzmqvsQQoaEjd98wGweppvE" }' --accountId mue.testnet

```

## Eliminar producto

```sh
near call productos.mue.testnet delete_products '{"address": "noemk3.testnet"}' --accountId mue.testnet
```

## Uso del Cross Contract Callback (bajo nivel)

```sh

near call productos.mue.testnet sum_a_b '{"a": 12, "b": 12}' --accountId mue.testnet

```
</br>
</br>

## USO DEL NODO thegraph:

</br>

## ver las entidades registradas:
ir a https://thegraph.com/hosted-service/subgraph/noemk2/simi

## consultar entidades

```
{
  products(first: 5) {
    id
    name
    price
    stock
    cid
    enabled
  }
}

```
-- IMAGEN DE SUBGRAPH --