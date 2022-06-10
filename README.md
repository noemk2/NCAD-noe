# NEAR Certified AURORA Developer (DemoDay)


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

# Proyecto en la Red de Aurora

![plant](https://user-images.githubusercontent.com/37389982/173133705-c5053f78-c126-418b-bcec-c0a8a4214aaf.png)


## Titulo del Proyecto:
- Plant Tree


## Descripción :
- Nuestro objetivo es preservar los arboles, y aprender solidity es un contrato simple tipo crud para preservar los arboles

## Objetivos:
- sensivilar a la poblacion 

</br>
</br>

## 👨‍💻  Actividades realizadas:

</br>

## Contrato Utilizado: 
- Contrato Principal: `0x27eedAf79ddad4b6EB445868403Cdbc166Ce4b2D` 
    - url : `./contracts/1_Contract.sol`

## API del contrato:

</br>

### Inicializar contrato:

```sh
    near call productos.mue.testnet new '{"owner_id": "mue.testnet"}' --accountId $YOUR_ACCOUNT.testnet
```

### Obtener producto
```sh
    near view productos.mue.testnet get_products '{"address":"noemk3.testnet"}'
    near view productos.mue.testnet get_products '{"address":"nie.testnet"}'
    near view productos.mue.testnet  get_products '{"address":"mue.testnet"}'
```

### Guardar producto

```sh
  near call productos.mue.testnet set_products '{"address": "noemk3.testnet", "name": "phone 5", "price": 520, "stock": 50,"cid": "QmUWe3CW6NoFimZ34xWCKdzrveCD5zqExTAUeFzJ6nbDYp" }' --accountId mue.testnet


near call productos.mue.testnet set_products '{"address": "mue.testnet", "name": "phone 1", "price": 10, "stock": 10,"cid": "Qmb7VQPf7KFnXSQed5LWWQoCzmqvsQQoaEjd98wGweppvE" }' --accountId mue.testnet


near call productos.mue.testnet set_products '{"address": "nie.testnet", "name": "phone 4", "price": 40, "stock": 40,"cid": "Qmb7VQPf7KFnXSQed5LWWQoCzmqvsQQoaEjd98wGweppvE" }' --accountId mue.testnet

```

### Eliminar producto

```sh
near call productos.mue.testnet delete_products '{"address": "noemk3.testnet"}' --accountId mue.testnet
```


</br>
</br>


## Work Flow
</br>

<img src="https://user-images.githubusercontent.com/37389982/173131594-596f66a7-4c26-482c-8d8f-2d758d500c7f.png" alt="drawing" style="width:90%;"/>


<!-- </img> -->


## Uso del nodo de thegraph en near testnet
- https://thegraph.com/hosted-service/subgraph/noemk2/simi (nodo live en thegraph)
- ./Simi/src/mapping.ts (implementacion del subgraph) 

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
